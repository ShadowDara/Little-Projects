@REM Simple Shortcut Multitool by Shadowdara
@REM https://github.com/ShadowDara/tools

@echo off
title Multitool - by Shadowdara
chcp 65001 >nul
call :banner

echo [INFO] You can close programms with CTRL + C
echo.
echo 1) MSG-Formatter
echo.
set /p input="-------------------->" 
if /I %input% EQU 1 start "msg-formatter/start.bat"

exit /b

:banner
echo.
echo.
echo.
echo ███╗   ███╗██╗   ██╗██╗  ████████╗██╗████████╗ ██████╗  ██████╗ ██╗     
echo ████╗ ████║██║   ██║██║  ╚══██╔══╝██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo ██╔████╔██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo ██║╚██╔╝██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
echo ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║   ██║   ╚██████╔╝╚██████╔╝███████╗
echo ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo.
echo.
