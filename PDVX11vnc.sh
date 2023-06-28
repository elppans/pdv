#!/bin/bash

#  USAR O ARQUIVO 'X11vnc.sh'

for i in `seq 60 -1 1` ; do echo -ne "$i Seg.\r" ; sleep 1 ; done

pdvx11exec(){

clear
echo -e "\nExecutando X11VNC...\n\n"

nohup x11vnc -nopw -noshm -noxdamage -forever -env FD_XDM=1 -cursor arrow -shared -rfbport 5900 -display :0 -auth /var/run/lightdm/root/:0 &>> /de$

#clear
#echo -e "\nReexecutando X11VNC...\n\n"
sleep 5

pdvx11exec
}
pdvx11exec
