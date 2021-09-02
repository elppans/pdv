#!/bin/bash

## ZIP
if ! dpkg -l zip | grep ^ii ; then
wget -c http://us.archive.ubuntu.com/ubuntu/pool/main/z/zip/zip_3.0-11_i386.deb && dpkg -i zip_3.0-11_i386.deb
wget -c http://us.archive.ubuntu.com/ubuntu/pool/main/u/unzip/unzip_6.0-20ubuntu1_i386.deb && dpkg -i unzip_6.0-20ubuntu1_i386.deb
fi
## ZIP

DATA="$1"
ECF="$2"
ZMV="$3"
ZMVID=$(echo "$ZMV" | cut -d '.' -f '1')
ETQ=$(cat /Zanthus/Zeus/pdvJava/ETIQUETL.TXT | grep ZMAN | cut -d ']' -f '1' | cut -d '[' -f '2' | head -n1)

mkdir -vp "$DATA"_"$ECF"
cp -av lnx_conv_"$ETQ" "$ZMV" "$DATA"_"$ECF"
cd "$DATA"_"$ECF"
cp -av "$ZMV" TH01HK"$ETQ".TRA
./lnx_conv_"$ETQ" -m
./lnx_conv_"$ETQ" -s
cp -av TRAB1.SDF "$ZMVID".ZAN
ECF=$ECF && ls -1tr *.$ECF | head -n1 && ls -1tr *.$ECF | tail -n1
cut -c26-31 $(ECF=$ECF && ls -1tr *.$ECF | head -n1)
cut -c26-31 $(ECF=$ECF && ls -1tr *.$ECF | tail -n1)
read -p "Aperte ENTER para continuar..."
mkdir -vp /Zanthus/Zeus/path_comum/MOVIMENTO/
cp -av /Zanthus/Zeus/pdvJava/"$DATA"_"$ECF" /Zanthus/Zeus/path_comum/MOVIMENTO/
cd /Zanthus/Zeus/path_comum/MOVIMENTO/
#tar -zcvf "$DATA"_"$ECF".tgz "$DATA"_"$ECF"
zip -r "$DATA"_"$ECF".zip "$DATA"_"$ECF"
