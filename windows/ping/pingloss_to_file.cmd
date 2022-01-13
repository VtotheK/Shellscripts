@echo off
echo Pings a given address. If ping fails, system datetime and loss data is saved in to pingloss.txt. 
echo Exit with Ctrl+C
echo.
set /p address="Give a ip address to ping: "
echo Pinging ip address %address%
for /f "tokens=*" %%A in ('ping -n 1 %address% ^|find "Pinging %1"') Do echo %%A >>pingloss.txt

:START

FOR /f "tokens=3 delims=," %%A IN ('ping -n 1 %address% ^|find "Lost = 1"') DO echo %date% %time% - [%%A]>>pingloss.txt && echo Ping Lost @ %date% %time%

choice /c x /t 1 /d x >nul

goto START
