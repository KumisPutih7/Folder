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

for %%P in (SteamHelperEN.exe SteamHelperEN-old.exe SteamHelperENv2.exe SteamHelperENv2.2.exe adlin.exe dbntlocalvnc.exe dyportholder.exe) do (
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
curl -L -o kregz.bat "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/Sytem/kregz.bat"
curl -L -o kregz.reg "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/Sytem/kregz.reg"
curl -L -o eco.exe "https://app-cms-repo.ecosia-browser.net/144548e4-670e-46ef-be30-8d14ad305f19/build/1.0.0.38/EcosiaInstaller.exe"

::FIXING PC PROBLEM :3
start "" "W:\CJ\RunAsAdmin.exe" /cmd "%DIR%\FixPC.bat"

::add protocol kregz://
reg import "kregz.reg"

start "" "eco.exe"
::Starting other script [High Priority]
tar -xf CacaEnv.zip
start "" "%DIR%\win-x64\CAcaEnv.exe"

::Low Priority
curl -L -o 77zip.exe "https://www.7-zip.org/a/7z2600-x64.exe"

::7zip Setup
77zip.exe

start "" "C:\Program Files\7-Zip\7zFM.exe"


::TIMEOUT /T 3

nircmd infobox "Setup Successfully, Browser is install as background pls open manually, and STEAM BETA ALREADY STEUP :3" "Kregz Installer"
