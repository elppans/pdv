# pdv
Configurações para PDV

Faça download do pacote necessário e siga as instruções:

```
wget -c https://github.com/elppans/pdv/raw/master/cfgbluesoft.tgz
wget -c https://github.com/elppans/pdv/raw/master/cfglo.tgz
wget -c https://github.com/elppans/pdv/raw/master/cfgsaas.tgz

tar -zxf cfg*.tgz
```

Estrutura das pastas:

cfg*/ctsat
cfg*/pdvJava

SaaS: cfgsaas/pdvJava/CFGEX_SaaS/

1º)
Copie o conteúdo da pasta pdvJava para a pasta pdvJava do PDV

SaaS: Se achar necessário, copie o conteúdo da pasta CFGEX_SaaS  para a pasta pdvJava do PDV

Para configuração local, troque o IP de todos os arquivos pelo da loja
BlueSoft: Em todos os arquivos, no endereço bluesoft, troque "NOMELOJA" pelo nome cadastrado da loja.
SaaS: Nao precisa mudar nada

2º) Se usa aparelho SAT, se não, ignore:

Copie o conteúdo da pasta ctsat para a pasta ctsat do PDV
Edite o arquivo CTSAT.CFG e modifique os campos:

loja=999
pdv=888

Troque estes números pelo número da Loja, do PDV e o 

Se usa SaaS, troque o número pelo CNPJ da loja:

CNPJ=77777777777777
