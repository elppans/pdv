#!/bin/bash

cat <<'EOF' > /etc/systemd/system/gsurf.service
[Unit]
Description=gsurf
After=network-online.target zanthus.service
StartLimitIntervalSec=0

[Service]
Type=simple
User=root
Restart=always
RestartSec=1
ExecStart=/gsurf/serverSSL -s sitef &

[Install]
WantedBy=multi-user.target
EOF
chmod +x /etc/systemd/system/gsurf.service
systemctl daemon-reload
systemctl enable gsurf.service
systemctl start gsurf.service
systemctl status gsurf.service
sed -i '/serverSSL/d' /etc/rc.local
