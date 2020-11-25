#!/bin/sh
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 0x89 --rotate right --output DisplayPort-2 --mode 1920x1080 --pos 1080x0 --rotate normal 
nitrogen --restore
