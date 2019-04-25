#!/bin/bash
pulseaudio &
feh --bg-fill --randomize ~/.wallpaper/* &
compton --backend glx --config ~/.config/compton/compton.conf &
dunst &
libinput-gestures-setup start &
mpd &
blugon -b scg &
nm-applet &
sh /home/gkeep/.dwm/statusbar.sh &
setxkbmap -option 'grp:alt_shift_toggle' -layout 'us,ru' &
