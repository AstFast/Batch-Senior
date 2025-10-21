@echo off
set "folder_path=%~1"

if "%folder_path%"=="" (
    exit /b 0
)

if exist "%folder_path%\" (
    echo.%folder_path%
    exit /b 1
) else (
    echo.%folder_path%
    exit /b 0
)