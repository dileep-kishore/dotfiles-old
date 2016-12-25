#!/bin/bash
xdpyinfo -ext XINERAMA | sed '/^  head #/!d;s///' |
while IFS=' :x@,' read i w h x y; do
    import -window root -crop ${w}x$h+$x+$y /tmp/head_$i.png
done
ICON=/home/dileep/.dotfiles/i3/lock.png
TMPBG0=/tmp/head_0.png
TMPBG1=/tmp/head_1.png
TMPBG=/tmp/screen.png
# scrot /tmp/screen.png
convert $TMPBG0 -scale 10% -scale 1000% $TMPBG0
convert $TMPBG1 -scale 10% -scale 1000% $TMPBG1
convert $TMPBG0 $ICON -gravity center -composite -matte $TMPBG0
convert $TMPBG1 $ICON -gravity center -composite -matte $TMPBG1
convert $TMPBG0 $TMPBG1 +append $TMPBG
i3lock -e -n -i $TMPBG

# if [[ -f $ICON ]] 
# then
#     # placement x/y
#     PX=0
#     PY=0
#     # lockscreen image info
#     R=$(file $ICON | grep -o '[0-9]* x [0-9]*')
#     RX=$(echo $R | cut -d' ' -f 1)
#     RY=$(echo $R | cut -d' ' -f 3)

#     SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
#     for RES in $SR
#     do
#         # monitor position/offset
#         SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
#         SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
#         SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
#         SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
#         PX=$(($SROX + $SRX/2 - $RX/2))
#         PY=$(($SROY + $SRY/2 - $RY/2))

#         convert $TMPBG $ICON -geometry +$PX+$PY -composite -matte  $TMPBG
#         echo "done"
#     done
# fi 
# i3lock -e -u -n -i $TMPBG
