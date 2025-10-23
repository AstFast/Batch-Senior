@echo off
setlocal enabledelayedexpansion
rem Returns the date and time when the specified file was last accessed.
rem Warning: The current script uses dangerous WMIC
rem Error:
rem 0:Code Success
rem 1:The folder does not exist
call Exists.bat %~1
if (!errorlevel!==0) (
    exit /b 1
)

set "access_time="
call :GetLastAccessTimeWMI %~1 access_time
echo !access_time!
exit /b 0

:GetLastAccessTimeWMI
set "file_path=%~1"
set "result_var=%~2"
set "wmi_time="

REM WMIC Get Last Access Time
for /f "skip=1 tokens=1,2 delims==" %%a in ('wmic datafile where "name='%file_path:\=\\%'" get LastAccessed /value 2^>nul') do (
    if "%%a"=="LastAccessed" set "wmi_time=%%b"
)

if defined wmi_time (
    REM YYYYMMDDHHMMSS.ffffff±UUU
    set "date_part=!wmi_time:~0,8!"
    set "time_part=!wmi_time:~8,6!"
    set "formatted_time=!date_part:~0,4!/!date_part:~4,2!/!date_part:~6,2! !time_part:~0,2!:!time_part:~2,2!:!time_part:~4,2!"
    set "%result_var%=!formatted_time!"
) else (
    set "%result_var%=Time not available"
)
goto :eof