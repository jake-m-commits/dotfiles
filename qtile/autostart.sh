#!/usr/bin/env bash

### Startup ###
# conky &> /dev/null &
# caffeine -a &> /dev/null &

#set background
if [ -x "$(command -v feh)" ]; then
  feh --bg-scale ~/Pictures/walls/ultra-wide/0011.jpg
fi

# start compositor
if [ -x "$(command -v picom)" ]; then
  picom &> /dev/null &
fi

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
