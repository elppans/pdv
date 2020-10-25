#!/bin/bash

# https://s3.amazonaws.com/canoax.repo/zanthus/ub1204lts-zanthus-php56.sh

MODULOPHPPDV=moduloPHPPDV_2_14_132_123-c-20281_php_5_6.zip

mkdir -p /Zanthus/Zeus/path_comum/moduloPHPPDV
wget -c ftp://ftp.zanthus.com.br:2142/pub/Zeus_Retail/ModuloPDV/"$MODULOPHPPDV" -O /Zanthus/Zeus/path_comum/moduloPHPPDV/moduloPHPPDV.zip
wget -c https://raw.githubusercontent.com/elppans/pdv/master/php-5.6.28_zend_no-debug-non-zts-20131226.tgz
wget -c http://br2.php.net/get/php-5.6.28.tar.gz/from/this/mirror -O php-5.6.28.tar.gz

rm -rf /etc/apt/sources.list.d/* /etc/apt/sources.list
echo -e '
deb http://old-releases.ubuntu.com/ubuntu precise main universe restricted multiverse
deb http://old-releases.ubuntu.com/ubuntu precise-updates main universe restricted multiverse
deb http://old-releases.ubuntu.com/ubuntu precise-security main universe restricted multiverse
deb http://old-releases.ubuntu.com/ubuntu precise-proposed main universe restricted multiverse
deb http://old-releases.ubuntu.com/ubuntu precise-backports main universe restricted multiverse
' | tee /etc/apt/sources.list >> /dev/null

apt-get update
apt-get clean ; apt-get autoclean
apt-get install -y libmcrypt-dev

tar zxf php-5.6.28.tar.gz && cd php-5.6.28
./configure \
    --enable-mbstring \
    --with-zlib \
	--enable-zip \
	--with-gd \
	--enable-soap \
	--enable-sockets \
	--enable-pcntl \
	--enable-sigchild \
	--enable-bcmath \
	--enable-exif \
	--with-openssl \
	--with-curl=/usr \
	--disable-cgi \
	--enable-gd-native-ttf \
	--with-mcrypt \
    --without-sqlite3 \
    --without-pdo-sqlite \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr
    make && make install

sed -i "s/zend_extension/#zend_extension/g" /usr/local/lib/php.ini
echo -e 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/ZendGuardLoader.so\n' | tee -a /usr/local/lib/php.ini

###	Empacotamento
apt-get -y install checkinstall
checkinstall -D -y
mkdir -p php_5.6.28-1_i386
dpkg-deb -R php_5.6.28-1_i386.deb php_5.6.28-1_i386
cp -rfv /usr/local/lib/php.ini php_5.6.28-1_i386/usr/local/lib/
tar -zxvf ../php-5.6.28_zend_no-debug-non-zts-20131226.tgz -C php_5.6.28-1_i386/usr/local/lib/php/extensions/
mv php_5.6.28-1_i386.deb php_5.6.28-1_i386.deb.old
dpkg-deb -b php_5.6.28-1_i386 php_5.6.28-1_i386.deb
###	FIM Empacotamento

tar zxvf ../php-5.6.28_zend_no-debug-non-zts-20131226.tgz -C /usr/local/lib/php/extensions/
cd .. && rm -rf php-5.6.28 php-5.6.28.tar.gz php-5.6.28_zend_no-debug-non-zts-20131226.tgz

service zanthus stop ; service zanthus start

cd /Zanthus/Zeus/path_comum/moduloPHPPDV
rsync -ravzpt moduloPHPPDV.zip /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV/
cd /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/moduloPHPPDV/
unzip -o moduloPHPPDV.zip
rm -rf sat_lab.conf*
chmod -R 777 *

echo " "
echo "FIM do patch" 
echo "========= ATENCAO ========="
echo "Certifique-se de estar com o ModuloPHP Zanthus para PHP5.6 na pasta /Zanthus/Zeus/pdvJava/GERAL/SINCRO/WEB/"
echo "==========================="

