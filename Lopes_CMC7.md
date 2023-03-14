[TOC]

#### Atualização bibliotecas PDV 64 bits

```bash
wget -c ftp://pdvtec:SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_u64/* -P /Zanthus/Zeus/lib_u64
ldconfig
```
#### Atualização bibliotecas PDV 32 bits

```bash
wget -c ftp://pdvtec:04rFXom1@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so/* -P /Zanthus/Zeus/lib
wget -c ftp://pdvtec:04rFXom1@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_ubu/* -P /Zanthus/Zeus/lib_ubu
wget -c ftp://pdvtec:04rFXom1@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/so_co5/* -P /Zanthus/Zeus/lib_co5
ldconfig
```



#### CMC-7 da CIS modelo MaxyScanII-CMM-1560-SK com interface USB

> lsusb -v -d 0802:3002
> idVendor           0x0802 Mako Technologies, LLC
> iManufacturer           1 CIS
> iProduct                2 CIS USB DEVICE

##### Seguir manual "MaxyScanII.pdf"

##### No Windows, configurar o CMC-7 pelo programa "MaxyScan II V1.1"

[![Lopes-CMC7-TESTE-01.png](https://i.postimg.cc/x81SD0nH/Lopes-CMC7-TESTE-01.png)](https://postimg.cc/vgkK5w1H)

##### No PDV, configuração do Leitor

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

##### No PDV, configuração do leitor de código CMC7

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

Copiar a biblioteca libsk_access.so\* para a pasta de bibliotecas do PDV



##### Libsk_access PDV 32 bits

```bash
wget -c ftp://pdvtec:$SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/Terceiros/Teclados/Smak/Bibliotecas/Linux/Versao_2_21/x86/libsk_access.so -P /Zanthus/Zeus/lib
ldconfig
```

##### Libsk_access PDV 64 Bits

```bash
wget -c ftp://pdvtec:$SENHA@ftp.zanthus.com.br:2142/pub/Zeus_Frente_de_Loja/_Complementares/Terceiros/Teclados/Smak/Bibliotecas/Linux/Versao_2_21/x64/libsk_access.so.64 -P /Zanthus/Zeus/lib_u64
ldconfig
```

Se o teclado USB não funcionar mesmo com a biblioteca adicionada corretamente na pasta lib, copie para a pasta lib do sistema:

32 bits:

```bash
cp -rf /Zanthus/Zeus/lib/libsk_access* /usr/lib
ldconfig
```

64 bits:

```bash
cp -rf /Zanthus/Zeus/lib_u64/libsk_access* /usr/lib
ldconfig
```
Opcionalmente, pode fazer um link da biblioteca para dentro do pdvJava:


> /Zanthus/Zeus/pdvJava/libsk_access.so



#### Arquivo de configuração ECF9.CFG:

Teclado USB, deve usar o visor_op com o ID 18:

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

##### Configuração teclado Smak SKO-44

Feito configuração conforme o padrão do manual [gccf0104-roteiro-de-parametrizacao-teclados-2](https://docs.zanthusonline.com.br/documentacao/gccf0104-roteiro-de-parametrizacao-teclados-2/#sko-44-ps-2)

##### TESTE Leitor 

Verificar a função no Manager, pagina `Cadastros > Recebimentos e Pagamentos` e fazer a função conforme configurado.

[![Lopes-CMC7-TESTE-02.png](https://i.postimg.cc/85HV0FQN/Lopes-CMC7-TESTE-02.png)](https://postimg.cc/k6BZVggp)

Nesta configuração, a função testada é 502.

##### Teste da função em 1 tecla

Administração, Valores de Parâmetros, Grupo: 80 - TECLAS DE FUNÇÕES

> Código da função, 502
> Padrão Zanthus, tecla da função, 72 (Letra `c` no teclado PC). Teste OK
>
> Padrão Lopes, tecla da função, 62 (Letra `c` no teclado PC). Teste OK

[![Lopes-CMC7-TESTE-03.png](https://i.postimg.cc/ydBHjmGL/Lopes-CMC7-TESTE-03.png)](https://postimg.cc/Lqyw612P)

#### Teste com Novo Layout padrão SKO-44 Zanthus

[![ECF9-CFG-Teclado-SKO44-Zanthus-pdf.png](https://i.postimg.cc/Y0DBtJCP/ECF9-CFG-Teclado-SKO44-Zanthus-pdf.png)](https://postimg.cc/tn6M5vPd)

####  Layout padrão SKO-44 Loja LOPES

Para configurar o novo parão, basta configurar o TECPC do ECF9.CFG de acordo com a imagem da tabela de códigos de teclas.

> TECLA:TECPC=TEC

Exemplo configuração do PDV de Homologação, LOPES 1001:

```bash
***** Configuracao de teclas teclado Smak Black 44 Teclas com Display *****
***** (Padrao Lopes) *****

tecla:27=2
tecla:200=70
tecla:208=101
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

tecla:92=5
tecla:8=1
tecla:42=56
tecla:13=58

tecla:113=11
tecla:97=6
tecla:122=21
tecla:106=77

tecla:119=63
tecla:115=83
tecla:120=255
tecla:107=73

tecla:101=52
tecla:100=32
tecla:117=104
tecla:111=98

tecla:114=74
tecla:102=105
tecla:118=54
tecla:112=80

tecla:116=88
tecla:103=85
tecla:105=62
tecla:39=95

tecla:121=100
tecla:104=93
tecla:109=106
tecla:47=108
```


> **PDVTec**: Marcelo
