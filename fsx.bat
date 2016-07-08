
dc64 -width=1280 -height=800
start "" "fsx.exe"
set iamset=0
:loop
sleep 1
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