#!/bin/bash

kgx
sleep .1s
#COMMANDS HERE

xdotool type 'cd Documents/GIT/static-frontend'
xdotool key enter
xdotool type 'nvim .'
xdotool key enter
xdotool key enter
kgx
sleep .1s
xdotool type 'cd Documents/GIT/static-frontend'
xdotool key enter

#COMMANDS HERE
sleep .1s
xdotool key Super+KP_9
sleep .1s
xdotool key alt+quoteleft
sleep .1s
xdotool key Super+KP_7
sleep .1s
xdotool key Escape

xdotool keydown --delay 50  alt
xdotool key --delay 50 quoteleft quoteleft
xdotool keyup --delay 50  alt
sleep .3s
xdotool key --delay 50 alt+space Up
xdotool key enter

