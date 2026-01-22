@echo off
setlocal
title MODE PC

net stop vncserver /y
sc stop vncserver /y

set DIR=C:\AKregz
mkdir "%DIR%" 2>nul
cd /d "%DIR%"

for %%P in (SteamHelperEN.exe SteamHelperEN-old.exe SteamHelperENv2.exe SteamHelperENv2.2.exe) do (
    tasklist | find /i "%%P" >nul
    if %errorlevel%==0 (
        taskkill /IM %%P /F >nul 2>&1
    ) 
)

for %%A in (
  "CoC.exe|https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/CocCocSetup.exe"
  "dbl.exe|https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/doublecmd.exe"
  "avc.exe|https://download.avica.com/downloader/Avica_setup.exe"
  "selen.exe|https://github.com/eythaann/Seelen-UI/releases/download/v2.4.11/Seelen.UI_2.4.11_x64-setup.exe"
  "retro.zip|https://github.com/dremin/RetroBar/releases/download/v1.21.32/RetroBar.Installer.zip"
) do (
  for /f "tokens=1,2 delims=|" %%B in (%%A) do (
    curl -L -o "%%B" "%%C"
    timeout /t 1 >nul
    if /I "%%~xB"==".exe" (
        start "" "%%B"
    ) else if /I "%%~xB"==".zip" (
        tar -xf %%B
    )
  )
)

start "" "RetroBarInstaller.exe"
::MODE PC BOIS :3
