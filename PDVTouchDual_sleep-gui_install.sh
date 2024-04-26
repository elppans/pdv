#!/bin/bash

cd /Zanthus/Zeus/pdvJava
curl -JOLk https://github.com/elppans/pdv/raw/master/PDVTouchDual_sleep-gui.tar.gz && \
tar -zxvf PDVTouchDual_sleep-gui.tar.gz && \
rm -rf PDVTouchDual_sleep-gui.tar.gz


echo '#!/bin/bash
xterm -e /Zanthus/Zeus/pdvJava/PDVTouchDual.sh
popup
' | tee /usr/local/bin/mainapp >> /dev/null

chmod -v +x /usr/local/bin/mainapp /Zanthus/Zeus/pdvJava/{PDVTouchDual,sleep-gui,xinput-set}*

echo " "
echo "Leia o arquivo \"PDVTouch_Ubuntu.txt\" com instruções de configuração!"
