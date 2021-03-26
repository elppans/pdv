#!/bin/bash
ECF="$1"
ZMV="$2"
mkdir -p 25032021_$ECF
cp -av lnx_conv_CZ "$ZMV" 25032021_$ECF
cd 25032021_$ECF
cp -av "$ZMV" TH01HKCZ.TRA
./lnx_conv_CZ -m
mkdir -p /Zanthus/Zeus/path_comum/25032021
cp -rfv /Zanthus/Zeus/pdvJava/25032021_$ECF /Zanthus/Zeus/path_comum/25032021
