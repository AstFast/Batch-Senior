@echo off
setlocal enabledelayedexpansion
    
for /f "tokens=*" %%i in ('call GetARCVNumber.bat 1 2 3 4') do (
    set "RESULT=%%i"
)
echo !RESULT!