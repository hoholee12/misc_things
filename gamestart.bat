@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

start /b YookaLaylee64 -window-mode exclusive
set iamset=0
:loop
xtucli -t -id 59 -v 10.5
sleep 1
tasklist /FI "IMAGENAME eq YookaLaylee64.exe" 2>NUL | find /I /N "YookaLaylee64.exe">NUL
if %ERRORLEVEL% == 1 (
	if %iamset% == 1 (
		xtucli -t -id 59 -v 6.0
		exit
	)
) else (
	set iamset=1
)

goto loop