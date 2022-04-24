@echo off
title Power Plan Manager Script
set version=v1.0.0
set prefix=[Power Plan Manager]

echo -------------------------------------------------------------
echo Script 'Power Plan Manager_%version%' BY HanskiJay is running!
echo -------------------------------------------------------------
echo.
echo.
echo.
powercfg -l
echo.
echo.
echo.


:begin
set input=false
set res=false
set /p input=%prefix% Please select a valid Power Plan UUID (or enter "exit" to quit the script):
echo.
echo.


if %res%==exit (
    echo %prefix% Exit Script.
    pause
    exit
)
if %res%==%input% (
    echo %prefix% Invalid Input Message. Please retry!
    goto begin
) else (
    echo %prefix% Changed to UUID '%input%'. 
    powercfg -setactive %input%
    echo %prefix% Currently Power Plan:
    powercfg -getactivescheme
    echo.
    echo.
)


pause
exit
