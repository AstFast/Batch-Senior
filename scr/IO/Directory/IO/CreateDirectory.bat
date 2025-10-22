@echo off
rem Create a folder
rem Sample:CreateDirectory.bat C:\1
rem return:%errorlevel%
rem True:1,False:0

set "folder=%~1"
if not defined folder exit /b 0

echo "%folder%" | findstr /r "[|<>/?*]" >nul && (
    exit /b 0
)

mkdir "%folder%" 2>nul && (
    exit /b 1
) || (
    exit /b 0
)