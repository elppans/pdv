#!/bin/bash

# Remove Drivers NFE que da conflito no 1.5
#Zanthus, Eduardo

# So o usuario root pode rodar o script
if [[ $EUID -ne 0 ]]; then
   echo "==========================================="
   echo "ATENCAO:"
   echo "Esse script precisa ser executado como root" 1>&2
   echo "==========================================="
   echo
   exit 1
fi
     service cco-ser uninstall
     service mfe-https-ser uninstall

	echo "Parando e desabilitando o serviço das versoes anterioes"
        systemctl stop cco-ser.service
	systemctl disable cco-ser.service

	rm -f /lib/systemd/system/cco-ser.service
	rm -rf /Comunicador/logs

	echo "Finalizando Monitor..."
	killall -9 Monitor

	echo "Removendo arquivos e links do serviço"
	rm -f /etc/init.d/cco-ser
        rm -f /etc/init.d/mfe-https-ser

      max=6
      n=2
      while [ $n -lt $max ]
      do
       dir=/etc/init.d/rc$n.d
       cd $dir
	if [ $? -eq 0 ]; then
          echo "removendo no diretorio.. "$dir
          rm -f S80cco-ser
          rm -f S80mfe-https-ser
        fi
	true $(( n++ ))
      done

     n=2
      while [ $n -lt $max ]
      do
       dir=/etc/rc$n.d
       cd $dir
	if [ $? -eq 0 ]; then
          echo "removendo no diretorio.."$dir
          rm -f S80cco-ser
          rm -f S80mfe-https-ser
        fi
	true $(( n++ ))
      done

	# remove no linux librix
	rm -f /etc/local.d/03Comunicador.start
        rm -f /etc/local.d/03MfeHttps.start

	echo "Apagando diretórios e arquivos"
	rm -rf /opt/sefaz/cco
	rm -rf /opt/sefaz/drs
	rm -rf /opt/sefaz/mfe-tools
	rm -rf /etc/xdg/autostart/cco-mon.desktop
	#rm -rf ~/.config/autostart/cco-mon.desktop

	echo "Removendo permissão da serial"
	rm /etc/udev/rules.d/80-ttyS-sefaz.rules
