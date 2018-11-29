#!/bin/python
import os

isVGAConnected = open("/sys/class/drm/card0-VGA-1/status", "r")
isVGAConnected = isVGAConnected.read()

if "disconnected" in isVGAConnected:
    os.system("feh --bg-fill --randomize ~/.wallpaper/*")
else:
    os.system("bash /home/gkeep/scripts/dualscreen.sh && feh --bg-fill --randomize ~/.wallpaper/*")
