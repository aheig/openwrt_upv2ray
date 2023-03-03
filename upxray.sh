#! /bin/sh

# 仅适用于AMD64架构路由器升级Xray

echo   注意：仅适用于AMD64架构路由器升级Xray

opkg install unzip
cd /tmp
read -rp "请输入版本号：" Ver
wget https://github.com/XTLS/Xray-core/releases/download/v$Ver/Xray-linux-64.zip
unzip Xray*
chmod +rx xray
cp /usr/bin/xray /usr/bin/xray.bak
mv xray /usr/bin/
