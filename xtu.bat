for /F "tokens=3 delims=: " %%H in ('sc query "XTU3SERVICE" ^| findstr "        상태"') do (
	if /I "%%H" NEQ "RUNNING" (
		exit /b
	)
	timeout 1
)
for /L %%n in (1,0,10) do (
	start /wait xtucli -t -id 59 -v 9.0
	start /wait xtucli -t -id 59 -v 8.5
	timeout 300
)
