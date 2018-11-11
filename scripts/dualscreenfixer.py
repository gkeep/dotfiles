import os

isVGAConnected = open("/sys/class/drm/card0-VGA-1/status", "r")
isVGAConnected = isVGAConnected.read()

if "connected" in isVGAConnected:
    os.system("bash /home/gkeep/scripts/dualscreen.sh && feh --bg-fill --randomize ~/.wallpaper/*")
else:
    os.system("feh --bg-fill --randomize ~/.wallpaper/*")
