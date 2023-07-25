#!/bin/bash

# Verificar se o comando lsusb está instalado
if ! command -v lsusb &> /dev/null; then
    echo "O comando lsusb não está instalado. Instale-o primeiro."
    exit 1
fi

# Obter o ID do fornecedor e o ID do produto do dispositivo VeriFone Pinpad USB
VENDOR_ID_DO_PINPAD=$(lsusb | grep "VeriFone" | awk '{print $6}' | cut -d ':' -f 1)
ID_DO_PINPAD=$(lsusb | grep "VeriFone" | awk '{print $6}' | cut -d ':' -f 2)

# Verificar se o dispositivo foi encontrado
if [ -z "$VENDOR_ID_DO_PINPAD" ] || [ -z "$ID_DO_PINPAD" ]; then
    echo "Dispositivo VeriFone Pinpad USB não encontrado."
    exit 1
fi

# Criar a regra no arquivo .rules
RULE_STRING="ACTION==\"add\", SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"$VENDOR_ID_DO_PINPAD\", ATTRS{idProduct}==\"$ID_DO_PINPAD\", ATTRS{bInterfaceClass}==\"08\", ATTRS{bInterfaceSubClass}==\"06\", ATTRS{bInterfaceProtocol}==\"50\", SYMLINK+=\"ttyACM0\""

# Salvar a regra em um novo arquivo temporário
echo "$RULE_STRING" | sudo tee /etc/udev/rules.d/99-pinpad.rules.tmp

# Verificar se a regra é válida
if ! sudo udevadm test /etc/udev/rules.d/99-pinpad.rules.tmp; then
    echo "Regra inválida, não foi adicionada ao arquivo .rules."
    rm /etc/udev/rules.d/99-pinpad.rules.tmp
    exit 1
fi

# Mover o arquivo temporário para o arquivo .rules
sudo mv /etc/udev/rules.d/99-pinpad.rules.tmp /etc/udev/rules.d/99-pinpad.rules

# Recarregar as regras do udev
sudo udevadm control --reload-rules
sudo udevadm trigger

echo "Regra adicionada com sucesso!"
