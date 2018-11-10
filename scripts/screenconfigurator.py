import os

isVGAConnected = open("/sys/class/drm/card0-VGA-1/status", "r")

if isVGAConnected == "connected":
    os.system("bash /home/gkeep/scripts/dualscreen.sh && feh --bg-fill --randomize ~/.wallpaper/*")
else:
    os.system("feh --bg-fill --randomize ~/.wallpaper/*")
