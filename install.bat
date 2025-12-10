@echo off
REM 🚀 Memory Bank Agent Installer - Windows Entry Point
REM Prompts user to choose between PowerShell or Bash installation method

setlocal enabledelayedexpansion

REM Get the script's directory
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM Check for PowerShell
where powershell >nul 2>&1
set HAS_POWERSHELL=%ERRORLEVEL%

REM Check for Git Bash (common locations)
set HAS_BASH=1
if exist "C:\Program Files\Git\bin\bash.exe" (
    set HAS_BASH=0
    set BASH_PATH=C:\Program Files\Git\bin\bash.exe
)
if exist "C:\Program Files (x86)\Git\bin\bash.exe" (
    set HAS_BASH=0
    set BASH_PATH=C:\Program Files (x86)\Git\bin\bash.exe
)
if exist "%USERPROFILE%\AppData\Local\Programs\Git\bin\bash.exe" (
    set HAS_BASH=0
    set BASH_PATH=%USERPROFILE%\AppData\Local\Programs\Git\bin\bash.exe
)

REM If neither is available, show error
if %HAS_POWERSHELL% neq 0 if %HAS_BASH% neq 0 (
    echo.
    echo ⚠️  Error: Neither PowerShell nor Git Bash was found.
    echo.
    echo Please install one of the following:
    echo   1. PowerShell (comes with Windows 10/11, or download from Microsoft)
    echo   2. Git for Windows (includes Git Bash)
    echo.
    pause
    exit /b 1
)

REM If only one is available, use it automatically
if %HAS_POWERSHELL% equ 0 if %HAS_BASH% neq 0 (
    echo Using PowerShell...
    echo.
    powershell.exe -ExecutionPolicy Bypass -File "%SCRIPT_DIR%\install.ps1" %*
    exit /b %ERRORLEVEL%
)

if %HAS_POWERSHELL% neq 0 if %HAS_BASH% equ 0 (
    echo Using Git Bash...
    echo.
    "%BASH_PATH%" "%SCRIPT_DIR%\install" %*
    exit /b %ERRORLEVEL%
)

REM Both are available - prompt user
echo.
echo 🚀 Memory Bank Agent Installer
echo.
echo Choose installation method:
echo   [1] PowerShell (recommended for Windows)
echo   [2] Bash (Git Bash)
echo.
set /p CHOICE="Enter your choice (1 or 2): "

if "%CHOICE%"=="1" (
    echo.
    echo Using PowerShell...
    echo.
    powershell.exe -ExecutionPolicy Bypass -File "%SCRIPT_DIR%\install.ps1" %*
    exit /b %ERRORLEVEL%
)

if "%CHOICE%"=="2" (
    echo.
    echo Using Git Bash...
    echo.
    "%BASH_PATH%" "%SCRIPT_DIR%\install" %*
    exit /b %ERRORLEVEL%
)

REM Invalid choice
echo.
echo ⚠️  Invalid choice. Please run the script again and select 1 or 2.
echo.
pause
exit /b 1
