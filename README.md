# Feather Client Legacy Launcher

This project is for educational purposes only. It brings back the old Feather Client launcher experience. This community build has ads removed, automatic updates disabled, Microsoft and offline account support (including cracked/offline accounts), and launcher telemetry disabled.

The launcher is an unofficial community modification and is not affiliated with or endorsed by FeatherMC or Microsoft. Use accounts and game copies that you are authorized to use, and follow the terms that apply to your game and servers. Offline accounts do not authenticate with Microsoft; online-mode servers may reject them, and official account skins and entitlements may not be available.

## Install and uninstall

Run `Feather-Legacy-Client-Installer.exe` on Windows. It installs the complete launcher and bundled runtime under `%LOCALAPPDATA%\Programs\Feather Legacy Client`, adds Start Menu and desktop shortcuts, and registers an uninstaller in Windows Installed Apps. Uninstall it from Windows Installed Apps or the Start Menu.

## Rebuild the packaged app and installer

The unpacked application source is under `source/`. The packaging script repacks it into an Electron ASAR archive using the existing archive as its file-layout template:

```powershell
.\pack-asar.ps1 -OrigAsar .\app\resources\app.asar -SrcDir .\source -OutAsar .\app\resources\app.asar.offline.new
Copy-Item .\app\resources\app.asar.offline.new .\app\resources\app.asar -Force
```

Keep a backup of `app/resources/app.asar` before replacing it if you need to restore the original launcher.



## VirusTotal scan

[View the VirusTotal file analysis](https://www.virustotal.com/gui/file-analysis/ZjMxNzQzOWM4NGNlNTc4Yjk2ZmU5NWYxNTgyMjllNWM6MTc5MDU0OTgxNA==)


To build the Windows setup wizard, install Inno Setup and run:

```powershell
& "$env:LOCALAPPDATA\Programs\Inno Setup 7\ISCC.exe" .\Feather-Legacy-Client.iss
```


To compile the Windows setup wizard, install Inno Setup 7 and run:

```powershell
& "$env:LOCALAPPDATA\Programs\Inno Setup 7\ISCC.exe" .\Feather-Legacy-Client.iss
```



