#!/usr/bin/env bash

. /home/dileep/.dotfiles/i3/./password.sh

while true
do
    pkill firefox
    pkill palemoon
    pkill google-chrome
    pkill vivaldi
    pkill brave
    pkill midori
    pkill vlc
    pkill qutebrowser
    pkill seamonkey
    pkill opera-beta
    pkill opera
    echo $MY_PASSWORD | sudo -S chattr +i /etc/resolv.conf
    echo $MY_PASSWORD | sudo -S chattr +i /etc/hosts
    python $HOME/.dotfiles/i3/shutter.py /etc/resolv.conf /etc/hosts
    sleep 10
done

exit 0
