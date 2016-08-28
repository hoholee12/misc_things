::wait till XTU3SERVICE starts
for /F "tokens=3 delims=: " %%H in ('sc query "XTU3SERVICE" ^| findstr "        상태"') do (
	if /I "%%H" NEQ "RUNNING" (
		exit /b
	)
	timeout 1
)

::voltage offset
start /wait xtucli -t -id 34 -v -50.7812500
start /wait xtucli -t -id 79 -v -50.7812500
start /wait xtucli -t -id 83 -v -50.7812500

::prevent power/current limit throttling
start /wait xtucli -t -id 84 -v 1023.875
start /wait xtucli -t -id 66 -v 100.0
start /wait xtucli -t -id 49 -v 0
::start /wait xtucli -t -id 47 -v 4095.875 ::wont work if id 49 is 0
start /wait xtucli -t -id 48 -v 4095.875



::gpu ratio
for /L %%n in (1,0,10) do (
	::start /wait xtucli -t -id 59 -v 9.0
	start /wait xtucli -t -id 59 -v 8.5
	timeout 300
)
