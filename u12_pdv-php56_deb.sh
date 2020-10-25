#!/bin/bash

MODULOPHPPDV=moduloPHPPDV_2_14_132_123-c-20281_php_5_6.zip

wget -c https://raw.githubusercontent.com/elppans/pdv/master/php_5.6.28-1_i386.deb
dpkg -i php_5.6.28-1_i386.deb
service zanthus stop ; service zanthus start
cd /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV
wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Retail/ModuloPDV/"$MODULOPHPPDV"
unzip -o "$MODULOPHPPDV"
