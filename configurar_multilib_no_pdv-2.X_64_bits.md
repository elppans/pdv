# Configurar MULTILIB no PDV 2.X 64 bits

Configurar **MULTILIB no PDV 2.X 64 bits**

Sistema testado:

>Zeus PDV InstaladorPDV-2.U1604.415.1.4-64
Zeus PDV 2.0.rc21104-64bit-16.04-4.15.0-1385

CODFON Testado na loja:

>ZMAN[CZ] 1.X.152.610 (16.Fev.2023)

1) Configuração Multilib para SATs que não possuem bibliotecas 64 bits no momento.

Exemplos:

>URANO
TANCA

2) Configuração Multilib para Impressoras que não possuem bibliotecas 64 bits no momento.

Exemplos:

>TOSHIBA

Bibliotecas necessárias que não contém no diretório "so" local e no FTP:

>        libppxxx.so
        libclisitef.so
        libMop.so.3
        libMrBalanca.so.1
        libMrMaxyscan.so.1
        libMrScanner.so.1
        libPOS4000.so.1
        libRotOpera.so.1

Procedimento:

1) Ubuntu 22.04, deve ser convertido para sistema multilibpara funcionar o gsurf 32 bits:

mkdir -p ~/src
mv /etc/apt/sources.list.d/* ~/src
sudo apt-get update
sudo apt-get install libc6:i386 libgcc1:i386 libstdc++6:i386

1.0) (Bonus) locate:

apt-get -y install plocate
updatedb

1.1) Script para a instalação GSurf 32 bits:

wget -c https://raw.githubusercontent.com/elppans/pdv/master/gsurf-systemd_install.sh
bash gsurf-systemd_install.sh

2) CTSAT:

wget -c ftp://$USER:$PASSWORD@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/ctsat/lnx_ctsat_2_0_0.xz -P /Zanthus/Zeus/ctsat
chmod +x /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz

apt-get update
apt-get -y install libxml2:i386
apt-get -y install libstdc++5:i386
apt-get -y install libcurl4-openssl-dev:i386
apt-get -y -f install
apt-get -y install libssl-dev:i386
ln -sf /usr/lib/i386-linux-gnu/libssl.so /usr/lib/i386-linux-gnu/libssl.so.4 && \
ln -sf /usr/lib/i386-linux-gnu/libcrypto.so /usr/lib/i386-linux-gnu/libcrypto.so.4
ln -sf /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz /Zanthus/Zeus/ctsat/lnx_ctsat.xz64
ln -sf /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz /Zanthus/Zeus/ctsat/lnx_ctsat.xz
cp -a /opt/webadmin/packages/so /Zanthus/Zeus/lib
echo -e '/Zanthus/Zeus/lib' | tee -a /etc/ld.so.conf.d/zanthus.conf
ldconfig
____

3) RECEB:

3.1) Adicionando bibliotecas 32 bits do PDV 2.U1604.415.1.6:

echo -e 'https://www.dropbox.com/scl/fi/24lwk8lkeuvwer4tl49pa/Libs_PDV-2.U1604.415.1.6-32.tar.gz?rlkey=7ml0s23uxayf1jxcw106auvp3&dl=0' > files
xargs -n 1 curl -JOLk < files ; rm -rf files
tar -zxvf Libs_PDV-2.U1604.415.1.6-32.tar.gz -C /Zanthus/Zeus

3.2)Instalando dependências e configurando bibliotecas


sudo apt-get -y install libusb-0.1-4:i386
sudo apt-get -y install libncurses5:i386
ln -sf /lib/i386-linux-gnu/libusb-0.1.so.4.4.4 /lib/i386-linux-gnu/libusb-0.1.so.4

cp -a /opt/webadmin/packages/so_co5 /Zanthus/Zeus/lib_co5
cp -a /opt/webadmin/packages/so_ubu /Zanthus/Zeus/lib_ubu

echo -e '/Zanthus/Zeus/lib_co5' | tee -a /etc/ld.so.conf.d/zanthus.conf
echo -e '/Zanthus/Zeus/lib_ubu' | tee -a /etc/ld.so.conf.d/zanthus.conf

wget -c ftp://$USER:$PASSWORD@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so/* -P /Zanthus/Zeus/lib
wget -c ftp://$USER:$PASSWORD@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_co5/* -P /Zanthus/Zeus/lib_co5
wget -c ftp://$USER:$PASSWORD@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_ubu/* -P /Zanthus/Zeus/lib_ubu

ldconfig
____

4) Instalando pacote libssl1.0.0:i386 para a resolução da dependência não encontrada, libcrypto.so.1.0.0

wget -c http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb
dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb
apt-get -y -f install
ldconfig

____

5) Se opção 4 não for possível no momento, dá pra usar a biblioteca do PDV 2.U1604.415.1.6 32 Bits:

Local da biblioteca:

/opt/webadmin/extra/mfe/drs/libcrypto.so.1.0.0

Pacote empacotado:

echo -e 'https://www.dropbox.com/scl/fi/j7cuuvuebybidi2rkhrt3/MFE_PDV-2.U1604.415.1.6-32.tar.gz?rlkey=a0br7gtyxnayxmvk7dupk5h1y&dl=0' > files ; \\
xargs -n 1 curl -JOLk < files ; rm -rf files
tar -zxvf MFE_PDV-2.U1604.415.1.6-32.tar.gz
cp -rfv mfe/drs/libcrypto.so.1.0.0 /lib/i386-linux-gnu/
ldconfig

____

6) Instalando TODOS os pacotes .deb de uma vez (Somente PDV Ubuntu 22.04 x64):

echo -e 'https://www.dropbox.com/scl/fi/p49xtwnecft3cvi897q7l/archives.deb_PDV-U2204.519-64.tar.gz?rlkey=5v67xnsjktsofh9w13dgpohka&dl=0' > files ; \\
xargs -n 1 curl -JOLk < files ; rm -rf files
tar -zxvf archives.deb_PDV-U2204.519-64.tar.gz
dpkg -i archives/*
apt-get -i -f install
