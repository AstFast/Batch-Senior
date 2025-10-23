@echo off
setlocal enabledelayedexpansion
rem Returns the date and time when the specified directory was last written to.
:: .bat <path> <mode>
rem Mode:
rem: 0:Create  Time
rem  1 and default:Last modified time
rem  2:Last access time
rem Error:
rem  0:Code Success
rem  1:The folder does not exist
rem  2:Unknown Error
call Exists.bat "%~1"
if (!errorlevel!==0) (
    exit /b 1
)
set "Re_Error="
set "target_dir=%~1"
if ("%target_dir%"=="") (
    set "target_dir=."
)
set "modes=%~2"
if (%modes% equ 0) (
    call :GetDirTime /tc
    goto end
)
if (%modes% equ 1) (
    call :GetDirTime /tw
    goto end
)
if (%modes% equ 2) (
    call :GetDirTime /ta
    goto end
)
call :GetDirTime /tw
:end
exit /b !Re_Error!

:GetDirTime
set "time_field=%~1"
for /f "tokens=1-4" %%a in ('dir /ad %time_field% "%target_dir%" 2^>nul ^| findstr /i /c:"<DIR>"') do (
    echo %%a %%b
    set "Re_Error=0"
)
set "Re_Error=2"