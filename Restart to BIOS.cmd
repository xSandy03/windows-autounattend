@echo off
:: Restart to BIOS: restarts straight into the UEFI firmware settings (BIOS setup).
:: Double-click it; it asks for admin rights and a Y/N confirmation. Needs UEFI boot (not legacy/CSM).
set "___args="%~f0" %*"
fltmc > nul 2>&1 || (
    echo Administrator privileges are required.
    powershell -c "Start-Process -Verb RunAs -FilePath 'cmd' -ArgumentList """/c $env:___args"""" 2> nul || (
        echo You must run this script as admin.
        pause
        exit /b 1
    )
    exit /b
)

echo Restart into the BIOS (UEFI settings) now?
echo Save your work first: open programs are closed straight away.
choice /c YN /n /m "Press Y to restart, N to cancel: "
if errorlevel 2 exit /b 0

shutdown /r /fw /t 0
if errorlevel 1 (
    echo.
    echo Windows couldn't restart into the firmware settings.
    echo This needs UEFI boot; on legacy/CSM boot, press DEL during startup instead.
    pause
    exit /b 1
)
