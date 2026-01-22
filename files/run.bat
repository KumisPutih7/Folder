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
  "selen.zip|https://files.catbox.moe/5pwj8a.zip"
  "retro.zip|https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/Desktop/RetroBar.zip"
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

start "" "%DIR%\RetroBar\RetroBar.exe"
start "" "%DIR%\Seelen UI\seelen-ui.exe"

::MODE PC BOIS :3 gak work anjc
