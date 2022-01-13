@echo off
echo Pings a given address. If ping is succesful, system datetime and loss data is saved in to pingloss.txt. 
echo Exit with Ctrl+C
echo.
set /p address="Give a ip address to ping: "
echo Pinging ip address %address%
for /f "tokens=*" %%A in ('ping -n 1 %address% ^|find "Pinging %1"') Do echo %%A >>pingresponses.txt

:START

FOR /f "tokens=2 delims=," %%A IN ('ping -n 1 %address% ^|find "Received = 1"') DO echo %date% %time% - [%%A]>>pingresponses.txt && echo Ping Response @ %date% %time%

choice /c x /t 1 /d x >nul

goto START

