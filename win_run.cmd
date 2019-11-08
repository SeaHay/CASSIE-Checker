@echo off
Rem This is for running script.sh for the user if they have WSL on a Windows machine
SETLOCAL
set var = %cd%
ENDLOCAL

start %windir%\System32\cmd.exe /k Bash %var%\script.sh