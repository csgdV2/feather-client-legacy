param(
    [Parameter(Mandatory=$true)][string]$Asar,
    [Parameter(Mandatory=$true)][string]$OutDir
)

$fs = [System.IO.File]::OpenRead($Asar)
try {
    $br = New-Object System.IO.BinaryReader($fs)

    $null              = $br.ReadUInt32()
    $pickleSize        = $br.ReadUInt32()
    $null              = $br.ReadUInt32()
    $jsonLen           = $br.ReadUInt32()
    $jsonBytes         = $br.ReadBytes($jsonLen)
    $json              = [System.Text.Encoding]::UTF8.GetString($jsonBytes)

    $dataStart  = 8 + $pickleSize

    $header = $json | ConvertFrom-Json

    $unpackedDir = "$Asar.unpacked"

    function Write-Node {
        param($node, [string]$curPath)

        foreach ($propName in $node.files.PSObject.Properties.Name) {
            $entry  = $node.files.$propName
            $target = Join-Path $curPath $propName

            if ($null -ne $entry.files) {
                New-Item -ItemType Directory -Force -Path $target | Out-Null
                Write-Node -node $entry -curPath $target
            }
            else {
                New-Item -ItemType Directory -Force -Path (Split-Path $target -Parent) | Out-Null

                if ($entry.unpacked -eq $true) {
                    $rel = $target.Substring($script:OutRoot.Length).TrimStart('\')
                    $src = Join-Path $script:UnpackedDir $rel
                    if (Test-Path $src) { Copy-Item $src $target -Force }
                    else { Write-Warning "unpacked missing: $rel" }
                    continue
                }

                $size   = [int64]$entry.size
                $offset = [int64]::Parse([string]$entry.offset)
                $script:fs.Seek($script:dataStart + $offset, [System.IO.SeekOrigin]::Begin) | Out-Null

                $out = [System.IO.File]::Create($target)
                try {
                    $remaining = $size
                    $buf = New-Object byte[] 1048576
                    while ($remaining -gt 0) {
                        $toRead = [Math]::Min([int64]$buf.Length, $remaining)
                        $r = $script:fs.Read($buf, 0, [int]$toRead)
                        if ($r -le 0) { break }
                        $out.Write($buf, 0, $r)
                        $remaining -= $r
                    }
                } finally { $out.Close() }
            }
        }
    }

    $script:fs          = $fs
    $script:dataStart   = $dataStart
    $script:UnpackedDir = $unpackedDir
    $script:OutRoot     = (Resolve-Path (New-Item -ItemType Directory -Force -Path $OutDir)).Path

    Write-Node -node $header -curPath $script:OutRoot

    $count = (Get-ChildItem -Recurse -File $script:OutRoot | Measure-Object).Count
    Write-Output "Extracted $count files to $script:OutRoot"
}
finally {
    $fs.Close()
}
