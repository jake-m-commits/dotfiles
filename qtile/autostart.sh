#!/usr/bin/env bash

### Startup ###
# conky &
# caffeine -a &
nitrogen --random --set-scaled ~/Pictures/walls/
# xinput set-prop "SYNA3297:00 06CB:CD50 Touchpad" 335 1
# regular picom
picom -b

### Dual-monitor Setup ###
# intern=eDP1
# extern=DP2
# if xrandr | grep "$extern disconnected"; then
#   xrandr --output "$extern" --off --output "$intern" --auto
# else
#   # xrandr --output "$extern" --primary --auto --output "$intern" --below "$extern" --auto
#   xrandr --output "$intern" --off --output "$extern" --auto
# fi
