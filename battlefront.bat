@echo off
dc64 -width=1280 -height=800
start "" "battlefront.exe"
set iamset=0
:loop
sleep 1
tasklist /FI "IMAGENAME eq battlefront.exe" 2>NUL | find /I /N "battlefront.exe">NUL
if %ERRORLEVEL% == 1 (
	if %iamset% == 1 (
		dc64 -width=max -height=max
		exit
	)
) else (
	set iamset=1
)

goto loop