@echo off
setlocal enabledelayedexpansion
rem Get the number of passed parameters
rem return:%errorlevel%
set arg_count=0
:count_args
if not "%~1"=="" (
    set /a "arg_count=!arg_count!+1"
    shift
    goto count_args
)
exit /b !arg_count!