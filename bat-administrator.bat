@echo off
setlocal enabledelayedexpansion 
:: -----------------Examiner permissions----------------------
set file="%temp%\s.sys.vbs"
Reg.exe query "HKU\S-1-5-19\Environment" > nul 2>nul
If Not %ERRORLEVEL% EQU 0 (
  echo Set UAC = CreateObject("Shell.Application"^) > %file%
  echo UAC.ShellExecute "%~f0", "", "", "runas", 1 >> %file%
  start "" /WAIT %file%
  del %file%>nul 2>&1
  exit /b
)
cls
echo You already run this batch as an administrator.
pause
