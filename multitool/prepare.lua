-- To run the script
-- https://github.com/ShadowDara/flua/releases/tag/v0.1.13

-- Imports
local dapi = require("dapi")
local dapi_io = require("dapi_io")
local dapi_json = require("dapi_json")
local dapi_net = require("dapi_net")

dapi.check_version("0.1.13", true)

-- add MSG Formatter
dapi_net.download_file("https://github.com/ShadowDara/msg-formatter/releases/download/0.0.2/msg-formatter.zip", "multitool/msg-formatter.zip")
dapi_io.unzip("multitool/msg-formatter.zip", "multitool/msg-formatter")

-- add Touch Windows
dapi_net.download_file("https://github.com/ShadowDara/dotfiles/releases/download/w-touch-0.0.0/touch-windows.exe", "multitool/wrapperbin/touch.exe")

-- add Path Viewer Windows
dapi_net.download_file("https://github.com/ShadowDara/Path-Viewer/releases/download/0.0.1/paths.exe", "mutiltool/wrapperbin/paths.exe")

-- Jar Downloader

-- Video Converter
