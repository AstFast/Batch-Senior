@echo off
setlocal enabledelayedexpansion
setlocal enableExtensions
set "parent_path="
for %%I in ("%~dp0..") do set "parent_path=%%~fI"
set test_bat_path=!parent_path!\IO\GetFileName.bat
echo. !test_bat_path!
set "result="
!test_bat_path! c:\136436.txt > wss
pause
