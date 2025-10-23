@echo off
setlocal enabledelayedexpansion
::Return the names of files that meet the specified criteria
:: <mode1> <folder path> <mode2>
::mode1:
::  0:Basic Search
::  1:Mode Search
::  2:Recursively Search
::mode2:
::Sample: "*exe"
::Error:
::  0:Code Success
::  1:The folder does not exist
::  2:mode1 mismatch
set "files="
call Exists.bat %~1
if (!errorlevel! equ 0) (
    exit /b 1
)
if ("%~1" equ 0) (
    call :GetFilesAll "%~2"
) else (
    if ("%~1" equ 1) (
        call :GetFilesByPattern "%~2" "%~3" files
        ) else (
            if ("%~1" equ 2) (
                call :GetFilesRecursive "%~2" "%~3" files
            ) else (
                exit /b 2
            )
        )
    ) 
for %%f in (!files!) do echo %%f
exit /b 0

:GetFilesAll 
::<path> <result>
set "file_list="
for /r "%~1" %%i in (*) do (
    if defined file_list (
        set "file_list=!file_list! %%i"
    ) else (
        set "file_list=%%i"
    )
)
set "%~2=%file_list%"
goto :eof

:GetFilesByPattern 
::<path> <mode> <result>
set "file_list="
for /r "%~1" %%i in ('%~2') do (
    if defined file_list (
        set "file_list=!file_list! %%i"
    ) else (
        set "file_list=%%i"
    )
)
set "%~3=%file_list%"
goto :eof

:GetFilesRecursive 
::<path> <mode> <result>
set "file_list="
for /r "%~1" %%i in ('%~2') do (
    if defined file_list (
        set "file_list=!file_list! %%i"
    ) else (
        set "file_list=%%i"
    )
)
set "%~3=%file_list%"
goto :eof