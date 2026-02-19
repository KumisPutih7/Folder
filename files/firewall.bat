@echo off
title Enable Admin$ Share + PsExec Fix
color 0A

echo === Enabling Admin$ Share & PsExec Requirements ===
echo.

:: Enable admin share
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" ^
/v AutoShareWks /t REG_DWORD /d 1 /f

:: Allow full admin token over network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" ^
/v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f

:: Start server service
net start lanmanserver >nul 2>&1

:: Enable firewall rules for SMB
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes >nul 2>&1
netsh advfirewall firewall set rule group="Remote Service Management" new enable=Yes >nul 2>&1
netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=Yes >nul 2>&1

:: Restart services
net stop server >nul 2>&1
net start server >nul 2>&1

echo.
echo === DONE ===
echo Admin$ Share & PsExec requirement enabled.
echo Restart PC target recommended.
echo.
pause
