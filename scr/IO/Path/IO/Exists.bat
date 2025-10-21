
@echo off
rem Check whether the file or folder exists. 
rem If it exists, return 1; if not, return 0
rem Sample:Exists.bat C:\1.txt
rem return:%errorlevel%
rem True:1,False:0
set "target_path=%~1"

if "%target_path%"=="" (
    exit /b 0
)

if exist "%target_path%" (
    if not exist "%target_path%\" (
        exit /b 1
    ) else (
        exit /b 0
    )
) else (
    exit /b 0
)