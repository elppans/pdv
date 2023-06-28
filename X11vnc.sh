#!/bin/bash

## Copie este {*X11vnc.sh} para /Zanthus/Zeus/pdvJava e adicione o comando em qualquer Script inicializavel do PDV
#
# Possiveis locais para adicionar {*X11vnc.sh}
#
# 1 - /etc/rc.local
# 2 - /usr/local/bin/mainapp
# 3 - /Zanthus/Zeus/pdvJava/pdvJava2
# 4 - /Zanthus/Zeus/pdvJava/PDVJava.sh
# 5 - /Zanthus/Zeus/pdvJava/PDVPainel.sh
#
# Exemplo da execução:
#
# nohup /Zanthus/Zeus/pdvJava/X11vnc.sh >> /dev/null &
#

pdvx11exec(){

clear
echo -e "\nExecutando X11VNC...\n\n"

nohup x11vnc -nopw -noshm -noxdamage -forever -env FD_XDM=1 -cursor arrow -shared -rfbport 5900 -display :0 -auth /var/run/lightdm/root/:0 &>> /dev/null

pdvx11exec
}
pdvx11exec
