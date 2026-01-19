@echo off
setlocal
title MODE PC

net stop vncserver /y
sc stop vncserver /y

MKDIR C:\AKregz
cd C:\AKregz

for %%A in (
  "CoC.exe|https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/CocCocSetup.exe"
  "dbl.exe|https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/doublecmd.exe"
  "avc.exe|https://download.avica.com/downloader/Avica_setup.exe"
  "obs.exe|https://cdn-fastly.obsproject.com/downloads/OBS-Studio-32.0.4-Windows-x64-Installer.exe"
) do (
  for /f "tokens=1,2 delims=|" %%B in (%%A) do (
    curl -L -o "%%B" "%%C"
  )
)

timeout /t 1 >nul

for %%E in (CoC.exe dbl.exe avc.exe obs.exe) do (
  start "" "%%E"
)
