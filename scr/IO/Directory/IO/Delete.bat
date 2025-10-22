@echo off
setlocal enabledelayedexpansion
set "folder_path=%~1"
call Exists.bat %~1
if (!errorlevel! equ 1) (
    exit /b 1
) else (
    exit /b 0
)