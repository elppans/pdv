#!/bin/bash

PDV='/Zanthus/Zeus/pdvJava'
LIB='/Zanthus/Zeus/lib'
DCTSAT='/Zanthus/Zeus/ctsat'
LINK='ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/Java/java'
JAVA='jpdvgui-7-7-9-6.jar'
MODULO='moduloPHPPDV_2_14_130_122b-20216_php_5_6.zip'
ZMAN='ZMAN_1_X_X_444_CZ.tar.gz'
CTSAT='lnx_ctsat_1_0_20.xz'
LCTSAT="ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/ctsat/"$CTSAT""


 #! grep -e '\[Redes\]' "$PDV"/CliSiTef.ini >> /dev/null && \
 #       {
 #        echo  -e '[Redes]' | tee -a "$PDV"/CliSiTef.ini
	#echo OK
#}

 #! grep 'HabilitaRedePicPay=1' "$PDV"/CliSiTef.ini && \
  #      {
  #       sed -i '/\[Redes\]/a HabilitaRedePicPay=1' "$PDV"/CliSiTef.ini
	#echo OK

#}

##cp -rfv clisitef/* "$PDV"
##cp -rfv clisitef/* "$LIB"
##cp -rfv java/jpdvgui-7-7-9-6.jar /Zanthus/Zeus/pdvJava/pdvGUI/jpdvgui-7-7-9-6.jar
##cp -rfv "$ZMAN" "$PDV"
##cp -rfv "$MODULO" "$PDV"/GERAL/SINCRO/WEB/moduloPHPPDV/
cd "$PDV"
##tar -zxvf "$ZMAN"
##rm -rf libclisitef32.so "$LIB"/libclisitef32.so
cd "$PDV"/pdvGUI/
wget -c "$LINK"/"$JAVA"
unlink jpdvgui6.jar &>> /dev/null
rm -rf jpdvgui6.jar &>> /dev/null
ln -sf "$JAVA" jpdvgui6.jar
chmod -x *.jar
chmod +x "$JAVA"
ldconfig
cd "$PDV"/GERAL/SINCRO/WEB/moduloPHPPDV/
unzip -o "$MODULO"
cd "$PDV"
cd "$DCTSAT"
wget -c "$LCTSAT"
unlink lnx_ctsat.xz &>> /dev/null
ln -sf "$CTSAT" lnx_ctsat.xz
chmod +x lnx_ctsat.xz
