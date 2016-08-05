@echo off
dc64 -width=1280 -height=720
steam -applaunch 271590
set iamset=0
:loop
sleep 1
tasklist /FI "IMAGENAME eq GTA5.exe" 2>NUL | find /I /N "GTA5.exe">NUL
if %ERRORLEVEL% == 1 (
	if %iamset% == 1 (
		dc64 -width=max -height=max
		exit
	)
) else (
	set iamset=1
)

goto loop