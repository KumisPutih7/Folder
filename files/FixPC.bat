@echo off
title Unhide All Drives + Enable Properties
color 0A

echo [1/5] Menghapus policy drive (Current User)...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /f >nul 2>&1

echo [2/5] Menghapus policy drive (Local Machine)...
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /f >nul 2>&1

echo [3/5] Mengaktifkan kembali menu Properties...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoProperties /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoProperties /f >nul 2>&1

echo [4/5] Reset attribute drive (C-Z)...
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    attrib -h -s %%D:\ /s /d >nul 2>&1
)

echo [5/5] Restart Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo DONE! Drive terlihat & Properties sudah aktif kembali.
pause
exit