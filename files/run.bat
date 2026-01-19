@echo off
title MODE PC

net stop vncserver /y
sc stop vncserver /y

MKDIR C:\AKregz
cd C:\AKregz

curl -L -o CoC.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/CocCocSetup.exe"
curl -L -o dbl.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/doublecmd.exe"
curl -L -o avc.exe "https://download.avica.com/downloader/Avica_setup.exe"
curl -L -o obs.exe "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-32.0.4-Windows-x64-Installer.exe"

TIMEOUT /T 1

start "" "CoC.exe"
start "" "dbl.exe"
start "" "avc.exe"
start "" "obs.exe"
