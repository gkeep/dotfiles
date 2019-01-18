#!/bin/sh
killall -q pulseaudio
while pgrep -u $UID -x pulseaudio >/dev/null; do sleep 1; done
pulseaudio --daemonize
