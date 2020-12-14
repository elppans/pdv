#!/bin/bash

# Elgin 2, Logs

# Dependências:

# PDV 2.0+
# du =  8.25+
# systemd 229+
# cron 3.0pl1-128ubuntu2+
# Arquivo deve ficar em: "/etc/cron.hourly/"
# Após adicionar o arquivo na pasta, executar:
# systemctl restart cron.service

export EL2LOGS='/Zanthus/Zeus/ctsat/logsDrs'
export EL2DIR=$(du -sht +100M "$EL2LOGS" | awk '{print $2}')

if [ "$EL2LOGS" == "$EL2DIR" ]; then
        #echo  ""$EL2LOGS"/*"
        rm -rf "$EL2LOGS"/*
fi

