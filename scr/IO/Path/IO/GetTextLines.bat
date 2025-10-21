@echo off
setlocal enabledelayedexpansion
rem Sample:GetTextLines.bat "test.txt" 2 4
rem return:
:: Function to obtain the range of row numbers
set "filename=%~1"
set "start_line=%~2"
set "end_line=%~3"
set "counter=0"
for /f "usebackq delims=" %%i in ("%filename%") do (
    set /a counter+=1
    if !counter! geq !start_line! if !counter! leq !end_line! (
        echo.%%i
    )
    if !counter! gtr !end_line! exit /b
)
exit /b