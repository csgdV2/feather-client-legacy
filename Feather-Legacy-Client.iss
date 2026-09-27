#define MyAppName "Feather Legacy Client"
#define MyAppVersion "2.6.13-c"
#define MyAppPublisher "Feather Legacy Client Community"

[Setup]
AppId={{6B4C2B5D-94CB-4BCB-9DC2-4D9A6E96D02A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={localappdata}\Programs\Feather Legacy Client
DefaultGroupName=Feather Legacy Client
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
SetupIconFile=Feather-Legacy-Client.ico
UninstallDisplayIcon={app}\app\Feather Launcher.exe
OutputDir=.
OutputBaseFilename=Feather-Legacy-Client-Installer
Compression=lzma2/fast
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "app\chrome_100_percent.pak"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\chrome_200_percent.pak"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\d3dcompiler_47.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\dxcompiler.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\dxil.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\Feather Launcher.exe"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\ffmpeg.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\icudtl.dat"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\libEGL.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\libGLESv2.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\LICENSE.electron.txt"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\LICENSES.chromium.html"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\resources.pak"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\snapshot_blob.bin"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\v8_context_snapshot.bin"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\vk_swiftshader_icd.json"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\vk_swiftshader.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\vulkan-1.dll"; DestDir: "{app}\app"; Flags: ignoreversion
Source: "app\locales\af.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\am.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ar.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\bg.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\bn.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ca.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\cs.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\da.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\de.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\el.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\en-GB.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\en-US.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\es-419.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\es.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\et.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\fa.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\fi.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\fil.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\fr.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\gu.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\he.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\hi.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\hr.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\hu.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\id.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\it.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ja.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\kn.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ko.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\lt.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\lv.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ml.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\mr.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ms.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\nb.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\nl.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\pl.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\pt-BR.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\pt-PT.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ro.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ru.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\sk.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\sl.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\sr.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\sv.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\sw.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ta.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\te.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\th.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\tr.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\uk.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\ur.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\vi.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\zh-CN.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\locales\zh-TW.pak"; DestDir: "{app}\app\locales"; Flags: ignoreversion
Source: "app\resources\app-update.yml"; DestDir: "{app}\app\resources"; Flags: ignoreversion
Source: "app\resources\app.asar"; DestDir: "{app}\app\resources"; Flags: ignoreversion
Source: "app\resources\default_app.asar"; DestDir: "{app}\app\resources"; Flags: ignoreversion
Source: "app\resources\elevate.exe"; DestDir: "{app}\app\resources"; Flags: ignoreversion
Source: "app\resources\app.asar.unpacked\dist\native\cleanup.feather"; DestDir: "{app}\app\resources\app.asar.unpacked\dist\native"; Flags: ignoreversion
[Icons]
Name: "{autoprograms}\Feather Legacy Client"; Filename: "{app}\app\Feather Launcher.exe"; WorkingDir: "{app}\app"; IconFilename: "{app}\app\Feather Launcher.exe"
Name: "{autodesktop}\Feather Legacy Client"; Filename: "{app}\app\Feather Launcher.exe"; WorkingDir: "{app}\app"; IconFilename: "{app}\app\Feather Launcher.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\app\Feather Launcher.exe"; Description: "Launch Feather Legacy Client"; WorkingDir: "{app}\app"; Flags: postinstall nowait skipifsilent



