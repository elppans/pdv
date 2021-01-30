#!/bin/bash

mkdir -p /var/elgin
echo -e '[DEFAULT]\nSERIAL="/dev/ttyACM0"\n' > /var/elgin/sat.ini
cd /lib/udev/hwdb.d
mkdir -p ~/hwdb.lib
mv -v 20-usb-classes.hwdb ~/hwdb.lib
mv -v 20-usb-vendor-model.hwdb ~/hwdb.lib
cd /lib/udev/rules.d
mkdir -p ~/rules.lib
mv -v 40-usb_modeswitch.rules ~/rules.lib
#mv -v 60-serial.rules ~/rules.lib
#mv -v ~/rules.lib/60-serial.rules  /lib/udev/rules.d
mv -v 77-mm-usb-serial-adapters-greylist.rules ~/rules.lib
mkdir -p ~/rules.bkp
cd /etc/udev/
mv -v * ~/rules.bkp
mkdir -p rules.d
cd rules.d
#touch 99-pdv.rules

cat <<EOF > 80-tty_permissoes.rules
##      PERMISSOES
KERNEL=="ttyACM[0-9]*",MODE="0777"
KERNEL=="ttyUSB[0-9]*",MODE="0777"
KERNEL=="ttyS[0-9]*",MODE="0777"
EOF

cat <<EOF > 98-pinpad.rules
# PINPAD IGENICO IPP320 = 079b:0028
ACTION=="add", SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="079b", NAME+="ttyACM1"
ACTION=="remove", SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="079b", NAME-="ttyACM1"
#ACTION=="add", ATTRS{idVendor}=="079b", NAME+="ttyACM1"
#ACTION=="remove", ATTRS{idVendor}=="079b", NAME-="ttyACM1"
ACTION=="add", ATTRS{idVendor}=="079b", SYMLINK+="ttyPIN"
ACTION=="remove", ATTRS{idVendor}=="079b", SYMLINK-="ttyPIN"
EOF

cat <<EOF > 99-sat.rules
# SAT Smart: 2fe7:0001
ACTION=="add", SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="2fe7", NAME+="ttyACM0"
ACTION=="remove", SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="2fe7", NAME-="ttyACM0"
#ACTION=="add", ATTRS{idVendor}=="2fe7", NAME+="ttyACM0"
#ACTION=="remove", ATTRS{idVendor}=="2fe7", NAME-="ttyACM0"
ACTION=="add", ATTRS{idVendor}=="2fe7", SYMLINK+="ttySAT"
ACTION=="remove", ATTRS{idVendor}=="2fe7", SYMLINK-="ttySAT"
EOF

# ELGIN I9 =  20d1:7008
#KERNEL=="*[0-9]", SUBSYSTEM=="usb", ACTION=="add", ATTRS{idVendor}=="7008", ATTRS{idProduct}=="20d1", SYMLINK+="ttyEL1", OWNER="lp", GROUP="lp", MODE="0777"
#KERNEL=="*[0-9]", SUBSYSTEM=="usb", ACTION=="remove", ATTRS{idVendor}=="7008", ATTRS{idProduct}=="20d1", SYMLINK-="ttyEL1", OWNER="lp", GROUP="lp", MODE="0777"

# BALANCA CONFERENCIA TOLEDO
#ACTION=="add", ATTRS{idProduct}=="2206", ATTRS{idVendor}=="1509", SYMLINK+="ttyBAL"
#ACTION=="remove", ATTRS{idProduct}=="2206", ATTRS{idVendor}=="1509", SYMLINK-="ttyBAL"
#SUBSYSTEMS=="usb", ATTRS{idVendor}=="0a86", ATTRS{idProduct}=="0100", MODE="0777"

udevadm control --reload && udevadm control --reload-rules && udevadm trigger && systemctl restart systemd-udev-trigger.service systemd-udevd.service

# Porta no CliSiTef.ini:

# Porta=/dev/ttyPIN

grep -i porta /Zanthus/Zeus/pdvJava/CliSiTef.ini

cat /Zanthus/Zeus/ctsat/ZANSAT.CFG

#MODELO_SAT=ELGIN2
#CODIGO_ATIVACAO=123456789

#udevadm info --query=all --name=/dev/ttyACM0
#udevadm info --query=all --name=/dev/ttyACM0 | grep -E 'ID_VENDOR_ID|SUBSYSTEM|DEVNAME'
#udevadm info --attribute-walk --path=$(udevadm info --query=path --name=/dev/ttyACM0)

ls -all /dev/tty* | grep ACM

