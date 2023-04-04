
# OLD

#### E-MAIL

Configuração do PDV feita seguindo **MINUCIOSAMENTE** o e-mail enviado por "**Antonio Carlos** [mailto:a***@zanthus.com.br]", título "**cmc7 USB - Homologação**".

#### Sistema

> Distributor ID: Ubuntu
Description:    Zeus PDV InstaladorPDV-2.U1604.415.1.3-64
Release:        16.04
Codename:       xenial
Kernel: Linux 4.15.0-72-generic
Architecture: x86-64

#### Hardware

> Motherboard: ASUSTeK COMPUTER INC. J1800I-C/BR
Firmware (BIOS): American Megatrends Inc. versão 1002 (02/01/2019)
Processador: Intel(R) Celeron(R) CPU  J1800  @ 2.41GHz (processador com 2 núcleos)
System Memory: 4 GB (DIMM DDR3 1600 MHz (0,6 ns)
USB Controller: xHCI Host Controller usb-2.00

#### Rede

```bash
ifconfig eth0
```

> eth0      Link encap:Ethernet  HWaddr fc:34:97:7b:0f:89
          inet addr:192.168.10.80  Bcast:192.168.10.255  Mask:255.255.255.0

#### Pacotes

```bash
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt install libxml2-dev
sudo apt install libcurl4-openssl-dev
sudo apt-get install libssl-dev
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/libr/librabbitmq/librabbitmq-dev_0.7.1-1_amd64.deb
sudo dpkg -i librabbitmq-dev_0.7.1-1_amd64.deb
sudo apt-get -f install
wget -c http://security.ubuntu.com/ubuntu/pool/main//libu/libusb-1.0/libusb-1.0-0-dev_1.0.20-1_amd64.deb
sudo dpkg -i libusb-1.0-0-dev_1.0.20-1_amd64.deb
```
#### Versão do Java

```bash
 java --version
```

> java 11.0.2 2019-01-15 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.2+9-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.2+9-LTS, mixed mode)

#### CODFON

> ZMAN[CZ] 1.X.147.570 (01.Set.2022)

```bash
wget -c ftp://pdvtec:SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_u64/* -P /Zanthus/Zeus/lib_u64
ldconfig
```

#### Pinpad

> usb-GERTEC_PPC920_Pinpad_Terminal-if00

#### CMC-7 da CIS modelo MaxyScanII-CMM-1560-SK com interface USB

> lsusb -v -d 0802:3002
> idVendor           0x0802 Mako Technologies, LLC
> iManufacturer           1 CIS
> iProduct                2 CIS USB DEVICE

```bash
dmesg
```

>  [23429.389970] usb 1-4.2: new full-speed USB device number 5 using xhci_hcd
> [23429.494399] usb 1-4.2: New USB device found, idVendor=0802, idProduct=3002
> [23429.494405] usb 1-4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [23429.494409] usb 1-4.2: Product: CIS USB DEVICE
> [23429.494412] usb 1-4.2: Manufacturer: CIS
> [23429.501579] hid-generic 0003:0802:3002.0005: hiddev0,hidraw0: USB HID v1.11 Device [CIS CIS USB DEVICE] on usb-0000:00:14.0-4.2/input0
> [23429.503731] input: CIS CIS USB DEVICE as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4.2/1-4.2:1.1/0003:0802:3002.0006/input/input13
> [23429.562928] hid-generic 0003:0802:3002.0006: input,hidraw1: USB HID v1.11 Keyboard [CIS CIS USB DEVICE] on usb-0000:00:14.0-4.2/input1

#### Seguindo manual "MaxyScanII.pdf"

#### No Windows, configuração do leitor pelo programa "MaxyScan II V1.1"

[![Lopes-CMC7-TESTE-01.png](https://i.postimg.cc/x81SD0nH/Lopes-CMC7-TESTE-01.png)](https://postimg.cc/vgkK5w1H)

#### No PDV, configuração do Leitor

Desabilitar o uso do leitor através do uso da função 6402

Configurar o leitor: 

Função 6450 (se configurar como leitor óptico 1)

Função 6455 (se configurar como leitor -óptico 2)

| Parâmetro | Valor |
| --------- | ----- |
| Leitora   | 3     |
| Porta     | 13    |
| Classe    | 0     |

Habilite o uso do leitor através da execução da função 6401

#### No PDV, configuração do leitor de código CMC7

Desabilitar o leitor de CMC7, função 7302

Configurar o leitor, 7350

| Parâmetro   | Valor                                          |
| ----------- | ---------------------------------------------- |
| Leitor CMC7 | 5                                              |
| Porta       | 6 (Valor irrelevante, mas sugerido por padrão) |

Habilite o leitor através da função 7301

#### Teclado Smak modelo SKO-44

> b-) versão 1.99.9b da libsk_access 64 bits (libsk_access.so.64) para comunicação de alto nível com teclado Smak modelo SKO-44.
> c-) versão 1.6.17 (ou superior) da biblioteca de controle de periféricos de PDV Zanthus, perifpdv (lib3perifpdv.so).

Para que o PDV não trave ao usar uma tecla específica como função de pagamento, deve fazer um link da biblioteca do teclado para a pasta pdvJava. 
Ou seja, a biblioteca deve estar na pasta lib_u64, mas também deve haver um link desta mesma biblioteca na pasta pdvJava.

```bash
ls /Zanthus/Zeus/lib_u64/lib3perifpdv* -all
-rwxr-xr-x 1 root root 85456 Out 23  2019 lib3perifpdv.so.1.6.17.u64
lrwxrwxrwx 1 root root    26 Out 27 13:47 lib3perifpdv.so.u64 -> lib3perifpdv.so.1.6.17.u64
wget -c ftp://pdvtec:SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/Terceiros/Teclados/Smak/Bibliotecas/Linux/Versao_1_99_9b/x64/libsk_access.so.64 -P /Zanthus/Zeus/lib_u64
ldconfig
cp -av /Zanthus/Zeus/lib_u64/libsk_access* /usr/lib
ln -sf /Zanthus/Zeus/lib_u64/libsk_access.so.64 /Zanthus/Zeus/pdvJava/libsk_access.so
ldconfig
```
[![Teclado-SKO-LINK.png](https://i.postimg.cc/DfQGQkPY/Teclado-SKO-LINK.png)](https://postimg.cc/9zMzVkSG)  


> 1.4.2.1-) Arquivo de configuração ECF9.CFG com os seguintes parâmetros:

```bash
visor_op=18
visor_op_proibe_serial
```
Teclado PS/2, deve usar o visor_op com o ID 5:

```bash
visor_op=5
```



* Importante:

1) Sempre verificar se as linhas 789 não estão invertidas com as linhas 123 no arquivo ECF9.CFG, pois se estiverem ao passar um código 789001 será traduzido para 123007, ou seja, o scan code da tecla numérica tem que ser igual ao código de tecla numérica do teclado Zanthus (baseado no Z-6000), conforme exemplo abaixo:

```bash
tecla:55=25 --> tecla 7
tecla:52=26 --> tecla 4
tecla:49=27 --> tecla 1
tecla:48=28 --> tecla 0

tecla:56=35 --> tecla 8
tecla:53=36 --> tecla 5
tecla:50=37 --> tecla 2
tecla:48=28 --> tecla 0

tecla:57=45 --> tecla 9
tecla:54=46 --> tecla 6
tecla:51=47 --> tecla 3
tecla:46=48 --> tecla .

tecla:13=58 --> tecla ENTRA
```

2) Nos casos em que os clientes fazem uso das funcionalidades de extração e validação do código do funcionário que também prevê a captura de alfanuméricos e da coleta/captura de códigos alfanuméricos, teremos que ter o mesmo cuidado na configuração dos caracteres de "A" a "Z" e "a" a "z".

3) Na atividade não existem informações ou evidências detalhadas referentes aos conflitos e/ou travamentos. Nos ensaios realizados, detectamos que na programação atual do teclado SMAK (a identificação da programação é ZTM0) tem teclas com "scancodes" que coincidem com os prefixos usados pelos leitores de código de barras e CMC-7 para identificar captura de código de barras ou de CMC-7, conforme descrito nos testes de leitura usando o comando xxd.

#### Configuração teclado Smak SKO-44

Feito configuração conforme o padrão do manual [gccf0104-roteiro-de-parametrizacao-teclados-2](https://docs.zanthusonline.com.br/documentacao/gccf0104-roteiro-de-parametrizacao-teclados-2/#sko-44-ps-2)

#### TESTE Leitor 

Verificar a função no Manager, pagina `Cadastros > Recebimentos e Pagamentos` e fazer a função conforme configurado.

[![Lopes-CMC7-TESTE-02.png](https://i.postimg.cc/85HV0FQN/Lopes-CMC7-TESTE-02.png)](https://postimg.cc/k6BZVggp)

Nesta configuração, a função testada é 502.

#### Teste da função em 1 tecla

Administração, Valores de Parâmetros, Grupo: 80 - TECLAS DE FUNÇÕES

> Código da função, 502
> Padrão Zanthus, tecla da função, 72 (Letra `c` no teclado PC). Teste OK
>
> Padrão Lopes, tecla da função, 62 (Letra `c` no teclado PC). Teste OK

[![Lopes-CMC7-TESTE-03.png](https://i.postimg.cc/ydBHjmGL/Lopes-CMC7-TESTE-03.png)](https://postimg.cc/Lqyw612P)

#### Teste com Novo Layout padrão SKO-44 Zanthus

No manual escrito por Antonio Carlos, informa:

> "O arquivo "**Teclado_SKO44_Zanthus.pdf**" descreve o **novo mapeamento de teclas ASC** correspondente ao **novo "layout" programado.**"

Este arquivo contém apenas:

[![ECF9-CFG-Teclado-SKO44-Zanthus-pdf.png](https://i.postimg.cc/Y0DBtJCP/ECF9-CFG-Teclado-SKO44-Zanthus-pdf.png)](https://postimg.cc/tn6M5vPd)

O Layout então, corresponde à esta configuração:

```bash
rem_***************************************************************
rem_*_Configuracao_das_teclas_do_teclado_SKO-44_(PS/2)_por_coluna.*
rem_***************************************************************
# visor_op=5

tecla:27=2
tecla:200=104
tecla:208=105
_tecla_shift

tecla:55=25
tecla:52=26
tecla:49=27
tecla:48=28

tecla:56=35
tecla:53=36
tecla:50=37
tecla:45=38

tecla:57=45
tecla:54=46
tecla:51=47
tecla:46=48

tecla:92=124
tecla:8=6
tecla:42=56
tecla:13=58

tecla:113=81
tecla:97=65
tecla:122=90
tecla:106=74

tecla:119=87
tecla:115=83
tecla:120=88
tecla:107=75

tecla:101=69
tecla:100=68
tecla:117=85
tecla:111=79

tecla:114=82
tecla:102=70
tecla:118=86
tecla:112=80

tecla:116=84
tecla:103=71
tecla:105=73
tecla:39=34

tecla:121=89
tecla:104=72
tecla:109=77
tecla:63=47
```

>  Padrão novo Layout da Zanthus, tecla da função, 82 (Letra `c` no teclado PC). Teste OK

#### Teste com Layout padrão SKO-44 Loja LOPES

O Layout padrão do LOPES, corresponde à esta configuração:

```bash
rem ************************************************************************
rem *****        CONFIGURACAO TECLADO SKO-44 COM CONECTOR PS/2         *****
rem *****                     PADRAO LOPES                             *****
rem ************************************************************************

# visor_op=5

tecla:27=2
tecla:103=70
tecla:104=105
_tecla_shift

tecla:55=25
tecla:52=26
tecla:49=27
tecla:48=28

tecla:56=35
tecla:53=36
tecla:50=37
tecla:45=38

tecla:57=45
tecla:54=46
tecla:51=47
tecla:46=48

tecla:8=5
tecla:231=1
tecla:32=56
tecla:13=58

tecla:93=11
tecla:59=1
tecla:42=21
tecla:106=77

tecla:97=63
tecla:102=20
tecla:110=255
tecla:116=40

tecla:98=85
tecla:105=65
tecla:111=68
tecla:117=92

tecla:99=62
tecla:107=95
tecla:112=82
tecla:118=91

tecla:100=81
tecla:108=88
tecla:114=102
tecla:121=94

tecla:101=100
tecla:109=93
tecla:115=106
tecla:122=108
```


> **PDVTec**: Marcelo
