; use with task scheduler,
; program must be launched upfront for controlsend to work!

run, c:\eaLocalServer.exe
winwait, eaLocalServer
controlsend, , {enter}
winhide