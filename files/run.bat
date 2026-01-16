@echo off
net stop vncserver /y
sc stop vncserver /y
curl -L -o CoC.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/CocCocSetup.exe"
curl -L -o dbl.exe "https://raw.githubusercontent.com/KumisPutih7/Folder/main/files/doublecmd.exe"
curl -L -o avc.exe "https://download.avica.com/downloader/Avica_setup.exe"
start "" "CoC.exe"
start "" "dbl.exe"
start "" "avc.exe"
exit
