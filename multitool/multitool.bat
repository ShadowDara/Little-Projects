@REM Simple Shortcut Multitool by Shadowdara
@REM https://github.com/ShadowDara/tools

@echo off
title Multitool - by Shadowdara
chcp 65001 >nul
call :banner
call :main
exit /b

:main
echo [INFO] You can close programms with CTRL + C
echo.
echo "0) INFO"
echo "1) MSG-Formatter"
echo "2) Path Viewer"
echo.
set /p input="--------------------> "
if /I %input% EQU 0 start "INFO" "%~dp0wrapperbin\\multitoolinfo.cmd"
if /I %input% EQU 1 start "MSG-Formatter" "%~dp0msg-formatter\\start.bat"
if /I %input% EQU 2 start "Path Viewer" "%~dp0wrapperbin\\paths.exe"
echo.
pause
goto :eof

:banner
echo.
echo.
echo.
echo     ███╗   ███╗██╗   ██╗██╗  ████████╗██╗████████╗ ██████╗  ██████╗ ██╗     
echo     ████╗ ████║██║   ██║██║  ╚══██╔══╝██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo     ██╔████╔██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo     ██║╚██╔╝██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo     ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║   ██║   ╚██████╔╝╚██████╔╝███████╗
echo     ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo.
goto :eof
