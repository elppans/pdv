#!/bin/bash

PDV='/Zanthus/Zeus/pdvJava'
LIB='/Zanthus/Zeus/lib'
LINK='ftp://ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/Java/java'
JAVA='jpdvgui-7-7-9-6.jar'

 ! grep -e '\[Redes\]' "$PDV"/CliSiTef.ini >> /dev/null && \
        {
         echo  -e '[Redes]' | tee -a "$PDV"/CliSiTef.ini
	#echo OK
}

 ! grep 'HabilitaRedePicPay=1' "$PDV"/CliSiTef.ini && \
        {
         sed -i '/\[Redes\]/a HabilitaRedePicPay=1' "$PDV"/CliSiTef.ini
	#echo OK

}

cd "$PDV"
rm -rf libclisitef32.so "$LIB"/libclisitef32.so
cd "$PDV"/pdvGUI
wget -c "$LINK"/"$JAVA"
ln -sf "$JAVA" jpdvgui6.jar
chmod -x *.jar
chmod +x "$JAVA"
ldconfig
