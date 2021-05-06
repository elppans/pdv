#!/bin/bash

wget -c http://old-releases.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.19-10ubuntu2_i386.deb
wget -c http://old-releases.ubuntu.com/ubuntu/pool/main/g/glibc/libc-bin_2.19-10ubuntu2_i386.deb
wget -c http://old-releases.ubuntu.com/ubuntu/pool/main/g/glibc/libc-dev-bin_2.19-10ubuntu2_i386.deb
wget -c http://old-releases.ubuntu.com/ubuntu/pool/main/g/glibc/libc6-dev_2.19-10ubuntu2_i386.deb

dpkg -i libc6_2.19-10ubuntu2_i386.deb
dpkg -i libc-bin_2.19-10ubuntu2_i386.deb
dpkg -i libc-dev-bin_2.19-10ubuntu2_i386.deb
dpkg -i libc6-dev_2.19-10ubuntu2_i386.deb

wget -c http://old-releases.ubuntu.com/ubuntu/pool/main/w/wget/wget_1.16.1-1ubuntu1_i386.deb
dpkg -i wget_1.16.1-1ubuntu1_i386.deb

