#!/bin/sh
isVGAConnected=$(cat /sys/class/drm/card0-VGA-1/status);
# launch polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar --reload --config=$HOME/.config/polybar/config bar1 &
sleep 1
# execute monitor configuration and set wallpaper
if [ "$isVGAConnected" == "connected" ]; then
    sh $HOME/scripts/monitorconfiguration.sh
    feh --bg-fill --randomize $HOME/.wallpaper/*
else
    feh --bg-fill --randomize $HOME/.wallpaper/*
fi