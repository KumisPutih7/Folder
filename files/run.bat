@echo off
setlocal
title MODE PC

net stop vncserver /y
sc stop vncserver /y

net stop tvnserver /y
sc stop tvnserver /y

set DIR=W:\AKregz
mkdir "%DIR%" 2>nul
cd /d "%DIR%"

for %%P in (SteamHelperEN.exe SteamHelperEN-old.exe SteamHelperENv2.exe SteamHelperENv2.2.exe) do (
    tasklist | find /i "%%P" >nul
    if %errorlevel%==0 (
        taskkill /IM %%P /F >nul 2>&1
    ) 
)
curl -L -o nircmd.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/nircmd.exe"

nircmd infobox "Clear the text pls, steam will change to Steam Beta" "Kregz Installer"

timeout /t 2
taskkill /f /im steam.exe
timeout /t 3
start "" "G:\Steamonline_new\steam.exe"


nircmd infobox "Starting the installing, pls click OK" "Kregz Installer"

for %%A in (
  "mumucmd.exe|https://github.com/mucommander/mucommander/releases/download/1.5.2-1/mucommander-1.5.2.msi"
    "alo.exe|https://alohabrowser.com/pc/download/aloha_setup64.exe"
) do (
  for /f "tokens=1,2 delims=|" %%B in (%%A) do (
    curl -L -o "%%B" "%%C"
    timeout /t 1 >nul
    if /I "%%~xB"==".exe" (
        start "" "%%B"
    ) else if /I "%%~xB"==".zip" (
        tar -xf %%B
    ) else if /I "%%~xB"==".msi" (
        start "" "%%B"
    )
  )
)

nircmd infobox "PLS CLICK OK IF THE .EXE ALREADY INSTALLED ALL :3"

start "" "TE64.exe"
::start "" "%DIR%\RetroBar\RetroBar.exe"
::TIMEOUT /T 3

::start "" "%DIR%\Seelen UI\seelen-ui.exe"


::MODE PC BOIS :3 gak work anjc
nircmd infobox "Setup Successfully, Browser is install as background pls open manually, and STEAM BETA ALREADY STEUP :3" "Kregz Installer"
