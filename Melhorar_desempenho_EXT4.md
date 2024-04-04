# Desempenho EXT4



PDVs utilizados:



Versão: **2.0.rc20103-32bit-16.04-4.15.0-1355**

Versão: **InstaladorPDV-2.U1604.415.1.4-64**



A fim de melhorar a performance, foi feito análise e modificações no arquivo /etc/fstab do PDV Linux, aproveitando que o sistema de arquivos da raiz do mesmo é **EXT4**:



**<u>Opções padrão do PDV:</u>**



```shell
errors=remount-ro,nobarrier,commit=1,noatime
```



**Descrição das opções:**



**errors=remount-ro**: Remonta a partição como somente leitura em caso de erros.

**nobarrier**: Desativa a barreira de gravação para melhorar o desempenho.

**commit=1**: Confirma operações de gravação no disco a cada segundo.

**noatime**: Não registra acessos ao arquivo para melhorar o desempenho de leitura.



**Alteração do simples:**



```shell
errors=remount-ro,nobarrier,commit=10,noatime,nodiratime
```



**Descrição das opções alteradas:**



**commit=10**: Confirma operações de gravação a cada 10 segundos.

Aumentar o valor reduz a frequência de confirmação, melhorando o desempenho de escrita, mas aumentando ligeiramente o risco de perda de dados em caso de falha de energia.

**nodiratime**: Não registra acessos a diretórios, também para melhorar o desempenho de leitura.  



**Outras opções adicionadas (AVANÇADO):**



**noauto_da_alloc**: Reduz a fragmentação do sistema de arquivos e melhora o desempenho de gravação desativando a alocação automática de dados.

**delalloc**: Melhora o desempenho de gravação adiando a alocação real de espaço em disco até que os dados sejam gravados.

**max_batch_time=1000**: Otimiza o desempenho de gravação definindo o tempo máximo entre lotes de gravação para 1000 milissegundos.



**Opções configuradas:**



```shell
errors=remount-ro,nobarrier,commit=10,noatime,nodiratime,noauto_da_alloc,delalloc,max_batch_time=1000
```



**Teste**



```bash
mount -o remount,rw /
mount | grep " / "
```



Link indicativo para aplicativo de Markdown:

[Typedown - Aplicativo oficial na Microsoft Store](https://apps.microsoft.com/detail/9p8tcw4h2hb4?hl=pt-br&gl=BR)
