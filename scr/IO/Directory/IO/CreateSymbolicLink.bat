@echo off
setlocal enabledelayedexpansion
rem Check administrator permissions
rem Return:
rem 0:General Error
rem 1:Code Success
rem 2(Error):The target folder does not exist
call Exists.bat %~2
if !errorLevel! neq 0 (
    exit /b 2
)
net session >nul 2>&1
if !errorLevel! neq 0 (
    echo y | mklink /J "%~1" "%~2" >nul
) else (
    echo y | mklink /D "%~1" "%~2" >nul
)
if !errorlevel! equ 0 (
    exit /b 1
) else (
    exit /b 0
)
