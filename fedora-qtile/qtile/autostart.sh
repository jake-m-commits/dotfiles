#!/usr/bin/env bash

### Startup ###
# conky &
# caffeine -a &
nitrogen --set-scaled ~/Pictures/walls/ultra-wide/0011.jpg
# nitrogen --random --set-scaled ~/Pictures/walls/ultra-wide/
# xinput set-prop "SYNA3297:00 06CB:CD50 Touchpad" 335 1
# regular picom
picom -b

### Dual-monitor Setup ###
# main=DP-2
# second=HDMI-0
# if xrandr | grep "$second disconnected"; then
#   xrandr --output "$second" --off --output "$main" --auto
# else
#   # xrandr --output "$main" --primary --auto --output "$second" --right "$main" --auto
#   # xrandr --output "$main" --off --output "$second" --auto
#   xrandr --output "$second" --off --output "$main" --auto
# fi
