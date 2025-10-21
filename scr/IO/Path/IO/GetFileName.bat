@echo off
setlocal enabledelayedexpansion
rem Simple:
rem for /f "tokens=*" %%i in ('call GetFileName.bat C:\test.txt') do (
rem    set "RESULT=%%i"
rem )
rem echo !RESULT!
for %%I in ("%~1") do set "filename=%%~nI"
echo !filename!