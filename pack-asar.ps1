param(
    [Parameter(Mandatory=$true)][string]$OrigAsar,
    [Parameter(Mandatory=$true)][string]$SrcDir,
    [Parameter(Mandatory=$true)][string]$OutAsar
)

$ErrorActionPreference = "Stop"

$fs = [System.IO.File]::OpenRead($OrigAsar)
$br = New-Object System.IO.BinaryReader($fs)
$null = $br.ReadUInt32(); $null = $br.ReadUInt32(); $null = $br.ReadUInt32()
$jl = $br.ReadUInt32()
$origJson = [System.Text.Encoding]::UTF8.GetString($br.ReadBytes($jl))
$fs.Close()
$orig = $origJson | ConvertFrom-Json

$script:order  = New-Object System.Collections.Generic.List[string]
$script:offset = [int64]0
$script:SrcDir = (Resolve-Path $SrcDir).Path

function Build-Node($node, [string]$relPath) {
    $files = [ordered]@{}
    foreach ($name in $node.files.PSObject.Properties.Name) {
        $entry = $node.files.$name
        $childRel = if ($relPath) { "$relPath\$name" } else { $name }

        if ($null -ne $entry.files) {
            $files[$name] = @{ files = (Build-Node $entry $childRel) }
        }
        elseif ($entry.PSObject.Properties.Name -contains 'link') {
            $files[$name] = [ordered]@{ link = $entry.link }
        }
        elseif ($entry.unpacked -eq $true) {
            $files[$name] = [ordered]@{ size = [int64]$entry.size; unpacked = $true }
        }
        else {
            $srcPath = Join-Path $script:SrcDir $childRel
            $len = [int64](Get-Item -LiteralPath $srcPath).Length
            $files[$name] = [ordered]@{ size = $len; offset = [string]$script:offset }
            $script:order.Add($srcPath)
            $script:offset += $len
        }
    }
    return $files
}

$headerObj = @{ files = (Build-Node $orig "") }
$headerJson  = $headerObj | ConvertTo-Json -Depth 100 -Compress
$jsonBytes   = [System.Text.Encoding]::UTF8.GetBytes($headerJson)
$jsonLen     = $jsonBytes.Length

$payload     = 4 + $jsonLen
$aligned     = [int](( ($payload + 3) -band (-bnot 3) ))
$pad         = $aligned - $payload
$headerBufLen= 4 + $aligned

$out = [System.IO.File]::Create($OutAsar)
$bw  = New-Object System.IO.BinaryWriter($out)
$bw.Write([uint32]4)
$bw.Write([uint32]$headerBufLen)
$bw.Write([uint32]$aligned)
$bw.Write([uint32]$jsonLen)
$bw.Write($jsonBytes)
if ($pad -gt 0) { $bw.Write((New-Object byte[] $pad)) }
$bw.Flush()

$buf = New-Object byte[] 1048576
foreach ($src in $script:order) {
    $inp = [System.IO.File]::OpenRead($src)
    try { while (($r = $inp.Read($buf,0,$buf.Length)) -gt 0) { $out.Write($buf,0,$r) } }
    finally { $inp.Close() }
}
$out.Close()

Write-Output ("Packed {0} embedded files, data bytes: {1}, header json: {2} bytes" -f $script:order.Count, $script:offset, $jsonLen)
Write-Output ("Output: {0} ({1:N0} bytes)" -f $OutAsar, (Get-Item $OutAsar).Length)
