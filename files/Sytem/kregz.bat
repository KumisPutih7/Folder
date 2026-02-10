@echo off
set "url=%~1"

:: hapus kregz://
set "url=%url:kregz://=%"

:: hapus tanda kutip
set "url=%url:"=%"

:: kalau kosong → kaout.my.id
if "%url%"=="" (
    start "" "https://kaout.my.id"
) else (
    start "" "https://%url%.kaout.my.id"
)
