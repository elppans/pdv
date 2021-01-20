#!/bin/bash

if [ -e /usr/gsurf/gsurfcli.txt ] ; then
	echo "Gsurf ja esta instalado!"
	exit 0
fi

checkArchName=`uname -m`

case "$checkArchName" in
		"i386" | "i486" | "i586" | "i686")
			archName="x86"
			mkdir -p /gsurf
			cd /gsurf
			wget -c http://gsurf.com.br/lib/linux/gsclient_ubuntu_"$archName".zip
	if [ ! -e /gsurf/gsclient_ubuntu_"$archName".zip ]; then
		echo "gsclient nao foi baixado..."
		exit 0
	fi

			unzip -o gsclient_ubuntu_"$archName".zip
			;;
		"amd64" | "x86_64")
			archName="x64"
			mkdir -p /gsurf
			cd /gsurf
			wget -c http://gsurf.com.br/lib/linux/gsclient_ubuntu_"$archName".zip
	if [ ! -e /gsurf/gsclient_ubuntu_"$archName".zip ]; then
		echo "gsclient nao foi baixado..."
		exit 0
	fi

			unzip -o gsclient_ubuntu_"$archName".zip
			cp -fv /gsurf/gsclient_ubuntu_"$archName"/* /gsurf
			;;
		*)
			archName=""
			echo "Erro!"
			exit 0
			;;
	esac


chmod +x *
cp -rfv *.so /usr/lib
ldconfig
./instalador
./serverSSL -s sitef &

if ! grep 'serverSSL' /etc/rc.local ; then
sed -i '/startup/i /gsurf/serverSSL -s sitef &' /etc/rc.local
fi

ps aux | grep -v grep | grep sitef
netstat -anp | grep 4096 | grep -i listen ; lsof -i | grep 4096 ; nc -z -v 127.0.0.1 4096 | grep "succeeded"
telnet 127.0.0.1 4096

