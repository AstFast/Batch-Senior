@echo off
setlocal enabledelayedexpansion

rem Scripts Error

rem Returns specified directory date and time
rem Error:
rem  0:Code Success
rem  1:The folder does not exist
rem  2:Unknown Error
call Exists.bat %~1
if (!errorlevel!==0) (
    exit /b 1
)
set "target_dir=%~1"
if "%target_dir%"=="" set "target_dir=."
call :GetDirTime /tw

exit /b !Re_Error!

:GetDirTime
set "time_field=%~1"
for /f "tokens=1-4" %%a in ('dir /ad %time_field% "%target_dir%" 2^>nul ^| findstr /i /c:"<DIR>"') do (
    echo %%a %%b
    set "Re_Error=0"
)
set "Re_Error=2"