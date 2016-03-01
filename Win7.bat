@echo off
REM Check Windows version
ver | findstr /C:6. /C:10.
if %ERRORLEVEL% NEQ 0 (
    echo Wrong Windows version
    echo No changes done
    pause
    exit
)

powercfg /change /monitor-timeout-ac 0
powercfg /change /monitor-timeout-dc 0
echo ### Changes applied ###
pause