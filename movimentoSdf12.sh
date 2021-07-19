#!/bin/bash

DATA="$1"
ECF="$2"
ZMV="$3"
ZMVID=$(echo "$ZMV" | cut -d '.' -f '1')
mkdir -vp "$DATA"_"$ECF"
cp -av lnx_conv_CZ "$ZMV" "$DATA"_"$ECF"
cd "$DATA"_"$ECF"
cp -av "$ZMV" TH01HKCZ.TRA
./lnx_conv_CZ -m
./lnx_conv_CZ -s
cp -av TRAB1.SDF "$ZMVID".ZAN
ECF=$ECF && ls -1tr *.$ECF | head -n1 && ls -1tr *.$ECF | tail -n1
cut -c26-31 $(ECF=$ECF && ls -1tr *.$ECF | head -n1)
cut -c26-31 $(ECF=$ECF && ls -1tr *.$ECF | tail -n1)
read -p "Aperte ENTER para continuar..."
mkdir -vp /Zanthus/Zeus/path_comum/MOVIMENTO/"$DATA"_"$ECF"
cp -av /Zanthus/Zeus/pdvJava/"$DATA"_"$ECF" /Zanthus/Zeus/path_comum/MOVIMENTO/"$DATA"_"$ECF"
cd /Zanthus/Zeus/path_comum/MOVIMENTO/
tar -zcvf "$DATA"_"$ECF".tgz "$DATA"_"$ECF"
