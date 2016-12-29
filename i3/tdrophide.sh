#!/usr/bin/bash

xdotool behave $(xdotool getactivewindow) blur exec xdotool windowunmap $(xdotool getactivewindow) &
killall "xdotool"
