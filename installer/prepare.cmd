@echo off

@rem Prepare the build with a Lua Script
luajit multitool/prepare.lua

@rem Build the NSIS Installer
makensis installer/installer.nsi
