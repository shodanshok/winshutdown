@echo off
REM Check Windows version
ver | findstr /C:5.
if %ERRORLEVEL% NEQ 0 (
    echo Wrong Windows version
    echo ### No changes done ###
    pause
    exit
)

powercfg /n /change 3 /monitor-timeout-ac 0
powercfg /n /change 3 /monitor-timeout-dc 0
powercfg /n /s 3

REM Registry Edit
REM Read the batch file to review changes
set regfile=acpitemp.reg
echo Windows Registry Editor Version 5.00 > %regfile%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system] >> %regfile%
echo "ShutdownWithoutLogon"=dword:00000001 >> %regfile%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows] >> %regfile%
echo "ShutdownWarningDialogTimeout"=dword:00000001 >> %regfile%
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop] >> %regfile%
echo "ScreenSaveActive"="0" >> %regfile%
regedit %regfile%
del %regfile%

echo ### Changes applied ###
pause