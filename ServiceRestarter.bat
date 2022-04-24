@echo off
title Restart Services Script
set version=v1.0.0

echo -------------------------------------------------------------
echo Script 'ServicesRestarter_%version%' BY HanskiJay is running!
echo -------------------------------------------------------------
echo.


echo Please enter an number to restart service:
choice /N /C 01234 /D 0 /T 3 /M "[0: Restart All| 1: Only PHP| 2: Only Nginx| 3: Only MySQL| 4: Do Nothing] (Default: 0)"
echo.



goto %ERRORLEVEL%
if /i not "%ERRORLEVEL%"=="1" (
	goto finish
)



:1
net stop php
net start php
net stop nginx
net start nginx
echo Restarting MySQL service...
mysqld restart
goto finish
exit



:2
net stop php
net start php
goto finish



:3
net stop nginx
net start nginx
goto finish



:4
echo Restarting MySQL service...
mysqld restart
goto finish



:5
echo Restart plan was cancelled by YOU.
goto finish



:finish
echo Choosed service(s) was/were restarted.
echo.
pause
exit
