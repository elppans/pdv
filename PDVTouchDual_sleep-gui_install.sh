#!/bin/bash

cd /Zanthus/Zeus/pdvJava
curl -JOLk https://github.com/elppans/pdv/raw/master/PDVTouchDual_sleep-gui.tar.gz && \
tar -zxf PDVTouchDual_sleep-gui.tar.gz && \
rm -rf PDVTouchDual_sleep-gui.tar.gz

# X11vnc, verifica constantemente se o VNC está funcionando, caso necessário reativa novamente.
curl -JLk https://raw.githubusercontent.com/elppans/pdv/master/X11vnc.sh -o /Zanthus/Zeus/pdvJava/X11vnc.sh
chmod +x /Zanthus/Zeus/pdvJava/X11vnc.sh
sed -i '/pdvJava2/a /Zanthus/Zeus/pdvJava/X11vnc.sh &' /Zanthus/Zeus/pdvJava/PDVTouchDual.sh

echo '#!/bin/bash
xterm -e /Zanthus/Zeus/pdvJava/PDVTouchDual.sh
popup
' | tee /usr/local/bin/mainapp >> /dev/null

chmod -v +x /usr/local/bin/mainapp /Zanthus/Zeus/pdvJava/{PDVTouchDual,sleep-gui,xinput-set}*

echo " "
echo "Leia o arquivo \"PDVTouch_Ubuntu.txt\" com instruções de configuração!"
