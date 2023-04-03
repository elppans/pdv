# Configurar horário MANUAL no PDV.  

1) Desativar UTC e NTP conf  

```
sudo sed -i 's/UTC=yes/UTC=no/' /etc/default/rcS
echo -e 'UTC=no' | sudo tee -a /etc/default/rcS
sudo sed -i 's/NTPDATE_USE_NTP_CONF=yes/NTPDATE_USE_NTP_CONF=no/' /etc/default/ntpdate
```

2) Timezone São Paulo:  

```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
echo -e 'America/Sao_Paulo' | tee /etc/timezone >> /dev/null ; dpkg-reconfigure -f noninteractive tzdata ; hwclock -w
```

3) Setar RTC, NTP, LO, TZ  

```
timedatectl set-local-rtc 0
timedatectl set-ntp 0
timedatectl set-local-rtc 1 --adjust-system-clock
timedatectl set-timezone  "America/Sao_Paulo"
```

4) Corrigir horario usando NTPD  

```
ntpdate a.ntp.br
```

5) Configurar horário manualmente +1H  
> date -u = faz o sistema mostrar a data sem o TimeZone aplicado  

```
date -s "$(expr $(date +%H) + 1)":"$(date +%M)":"$(date +%S)" && hwclock -w
```

6) Matar PDV para subir novamente  

```
pkill -9 [Jj]av && pkill -9 lnx
```

#### Fontes:  
[Sync Timezone Ubuntu/Windows](https://www.edivaldobrito.com.br/como-corrigir-diferencas-de-tempo-entre-o-ubuntu-e-o-windows-em-sistema-com-dual-boot/)  
[date CMD](https://paulosantanna.com/2017/03/01/configuracoes-de-data-e-hora-via-terminal-no-linux/)  
