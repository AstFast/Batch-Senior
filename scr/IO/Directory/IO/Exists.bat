@echo off
rem Check whether the folder exists. 
rem If it exists, return 1; if not, return 0
rem Sample:Exists.bat C:\1
rem return:%errorlevel%
rem True:1,False:0
set "folder_path=%~1"

if "%folder_path%"=="" (
    exit /b 0
)

if exist "%folder_path%\" (
    exit /b 1
) else (
    exit /b 0
)