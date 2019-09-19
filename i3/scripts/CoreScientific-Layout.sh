#!/bin/sh
xrandr --output DP-2-1 --mode 1920x1080 --pos 0x0 --rotate left 
xrandr --output DP-2-2 --mode 1920x1080 --pos 1080x408 --rotate normal 
xrandr --output DP-2-3 --off 
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 3000x408 --rotate normal 
xrandr --output HDMI-2 --off 
xrandr --output HDMI-1 --off 
xrandr --output DP-2 --off 
xrandr --output DP-1 --off
