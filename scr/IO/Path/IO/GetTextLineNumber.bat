@echo off
setlocal enabledelayedexpansion
rem Sample:GetTextLineNumber.bat C:\1.txt
rem return:%errorlevel%
set "txtFile=%~1"
for /f "tokens=3 delims=:" %%a in ('find /c /v "" "!txtFile!"') do (
    set "lineCount=%%a"
)
exit /b !lineCount!