@echo off

set "SOURCE=W:\AKregz\Timpa.exe"

for %%D in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\ (
        for /r %%D:\ %%F in (launcher.exe) do (
            echo Replacing: %%F
            copy /y "%SOURCE%" "%%F"
        )
    )
)

pause
