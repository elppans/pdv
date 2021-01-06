#!/bin/bash

MODULOPHPPDV=moduloPHPPDV_2_14_124_117d-19275_php_5_6.zip


if ! ping -c 1 ftp.zanthus.com.br ; then
        echo -e "ftp zanthus nao comunica..."
	exit 0
fi

php --version | head -1 | grep 'PHP 5.4' && \
{
if ping -c 2 raw.githubusercontent.com ; then
	wget -c https://raw.githubusercontent.com/elppans/pdv/master/php_5.6.28-1_i386.deb
	dpkg -i php_5.6.28-1_i386.deb
	service zanthus stop ; service zanthus start
	cd /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV
	wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Retail/ModuloPDV/"$MODULOPHPPDV"
	unzip -o "$MODULOPHPPDV"
 else
        echo -e "Repositorio nao comunica..."
	echo -e "Nao e possivel atualizar o PHP para a versao 5.6!"
	exit 0
fi
}

