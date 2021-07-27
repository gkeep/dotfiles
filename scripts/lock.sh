#!/usr/bin/bash
i3lock --clock --indicator --line-uses-inside \
    --ignore-empty-password \
    --ring-width=10 \
    --image=/home/gkeep/.wallpaper/liquid_dark.png --fill \
    --ring-color=dcdfe7FF --inside-color=33374cBF \
    --keyhl-color=2d539eFF --bshl-color=cc517aFF \
    --insidever-color=dcdfe7FF --insidewrong-color=cc517aFF \
    --ringver-color=2d539eFF --ringwrong-color=cc517aFF \
    --separator-color=dcdfe7FF --verif-color=dcdfe7FF --wrong-color=dcdfe7FF \
    --time-color=dcdfe7FF --date-color=dcdfe7FF \
    --time-str="%H:%M" --date-str="%a, %b %d"
