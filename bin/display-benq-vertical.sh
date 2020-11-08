#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 2160x2760 --rotate normal \
    --output DP-1-1 --mode 3840x2160 --pos 0x0 --rotate left --output DP-1-2 --off \
    --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output DP-1-3 --off
