# Configurar lnx_ctsat 32 bits para executar no PDV 2.X 64 bits  

* Sistema testado:  

> Zeus PDV InstaladorPDV-2.U1604.415.1.4-64  

Recomendável para SATs que não possuem bibliotecas 64 bits no momento.  
Exemplo:  

> URANO  
TANCA

* Procedimento:  

1) Baixar a versão 2.0.0 do comando lnx_ctsat:  

```bash
wget ftp://USUARIO:SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/ctsat/lnx_ctsat_2_0_0.xz -P /Zanthus/Zeus/ctsat
chmod +x /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz
```

2) Instalar dependências  

```bash
apt-get update
apt-get -y install libxml2:i386
apt-get -y install libstdc++5:i386
apt-get -y install libcurl4-openssl-dev:i386
apt-get -y -f install
apt-get -y install libssl-dev:i386
ln -sf /usr/lib/i386-linux-gnu/libssl.so /usr/lib/i386-linux-gnu/libssl.so.4
ln -sf /usr/lib/i386-linux-gnu/libcrypto.so /usr/lib/i386-linux-gnu/libcrypto.so.4
ln -sf /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz /Zanthus/Zeus/ctsat/lnx_ctsat.xz64
ln -sf /Zanthus/Zeus/ctsat/lnx_ctsat_2_0_0.xz /Zanthus/Zeus/ctsat/lnx_ctsat.xz
cp -a /opt/webadmin/packages/so /Zanthus/Zeus/lib
echo -e '/Zanthus/Zeus/lib' | tee -a /etc/ld.so.conf.d/zanthus.conf
ldconfig
```


# Configurar lnx_receb 32 bits para executar no PDV 2.X 64 bits  

> Será verificado quando tiver tempo, mas as dependências faltantes são estas  

```bash
ldd lnx_receb | grep 'not found'
        libppxxx.so => not found
        libclisitef.so => not found
        libMop.so.3 => not found
        libMrBalanca.so.1 => not found
        libMrMaxyscan.so.1 => not found
        libMrScanner.so.1 => not found
        libPOS4000.so.1 => not found
        libRotOpera.so.1 => not found
        libusb-0.1.so.4 => not found
```
