@echo off
dc64 -width=1280 -height=800
start "" "C:\Program Files (x86)\Microsoft Flight Simulator X\fsx.exe"
set iamset=0
:loop
sleep 5
tasklist /FI "IMAGENAME eq fsx.exe" 2>NUL | find /I /N "fsx.exe">NUL
if %ERRORLEVEL% == 1 (
	if %iamset% == 1 (
		dc64 -width=max -height=max
		exit
	)
) else (
	set iamset=1
)

goto loop