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

for %%P in (SteamHelperEN.exe SteamHelperEN-old.exe SteamHelperENv2.exe SteamHelperENv2.2.exe adlin.exe dbntlocalvnc.exe) do (
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


::High Priority
curl -L -o CacaEnv.zip "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/Desktop/CairoFanMade.zip"
curl -L -o FixPC.bat "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/FixPC.bat"
curl -L -o Tako.exe "https://www.gpsoft.com.au/download/release"

::FIXING PC PROBLEM :3
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\FixPC.bat"

::inti nya mirip :3
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\Tako.exe"


::Starting other script [High Priority]
tar -xf CacaEnv.zip
start "" "%DIR%\win-x64\CAcaEnv.exe"

::Low Priority
curl -L -o tono.exe "https://github.com/maxthon/Maxthon/releases/download/7.3.1.8600/maxthon_7.3.1.8600_x64.exe"

::Brosar
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\tono.exe"

::start "" "TE64.exe"
::start "" "%DIR%\RetroBar\RetroBar.exe"
::TIMEOUT /T 3

::start "" "%DIR%\Seelen UI\seelen-ui.exe"
nircmd infobox "Setup Successfully, Browser is install as background pls open manually, and STEAM BETA ALREADY STEUP :3" "Kregz Installer"
