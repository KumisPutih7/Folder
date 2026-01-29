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


::High Priority
curl -L -o FixPC.bat "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/FixPC.bat"
curl -L -o XYAJ.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/XYplorer.exe"
curl -L -o avicc.exe "https://download.avica.com/downloader/Avica_setup.exe"
curl -L -o taskexpp.exe "https://github.com/DavidXanatos/TaskExplorer/releases/download/v1.7.1/TaskExplorer-v1.7.1.exe"

::FIXING PC PROBLEM :3
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\FixPC.bat"

::inti nya mirip :3
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\XYAJ.exe"

::Avica Setup
start "" "avicc.exe"

::Task Explorer setup
start "" "taskexpp.exe"

::Low Priority
curl -L -o alo.exe "https://alohabrowser.com/pc/download/aloha_setup64.exe"

::browser hola gk tw lupa
start "" "alo.exe"


::start "" "TE64.exe"
::start "" "%DIR%\RetroBar\RetroBar.exe"
::TIMEOUT /T 3

::start "" "%DIR%\Seelen UI\seelen-ui.exe"
nircmd infobox "Setup Successfully, Browser is install as background pls open manually, and STEAM BETA ALREADY STEUP :3" "Kregz Installer"
