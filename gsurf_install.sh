#!/bin/bash

if [ -e /usr/gsurf/gsurfcli.txt ] ; then
	echo "Gsurf ja esta instalado!"
	exit 0
fi

mkdir -p /gsurf
cd /gsurf
wget -c http://gsurf.com.br/lib/linux/gsclient_ubuntu_x86.zip

if [ ! -e /gsurf/gsclient_ubuntu_x86.zip ]; then
	echo "gsclient nao foi baixado..."
	exit 0
fi

unzip -o gsclient_ubuntu_x86.zip
chmod +x *
cp -rfv *.so /usr/lib
ldconfig
./instalador
./serverSSL -s sitef &
ps ax | grep sitef
telnet 127.0.0.1 4096

if ! grep 'serverSSL' /etc/rc.local ; then
sed -i '/startup/i /gsurf/serverSSL -s sitef &' /etc/rc.local
fi


