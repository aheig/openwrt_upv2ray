#!/bin/sh
wget https://github.com/felix-fly/v2ray-openwrt/releases/download/$VERSION/v2ray-linux-$platform.tar.gz -O /tmp/v2ray.tar.gz
wget https://raw.githubusercontent.com/felix-fly/v2ray-openwrt/master/v2ray.service
wget https://raw.githubusercontent.com/felix-fly/v2ray-openwrt/master/client-$config.json -O config.json
wget https://raw.githubusercontent.com/felix-fly/v2ray-adlist/master/site.dat

tar -xzvf /tmp/v2ray.tar.gz -C /tmp
if [[ $float == "float" ]]
then
  rm -f /tmp/v2ray
  mv /tmp/v2ray_softfloat v2ray
else
  rm -f /v2ray_softfloat
  mv /tmp/v2ray v2ray
fi
rm -f /tmp/v2ray.tar.gz
chmod +x v2ray v2ray.service

ln -s $DIR/v2ray.service /etc/init.d/v2ray
/etc/init.d/v2ray enable

sed -i "s/==YOUR DOMAIN or SERVER ADDRESS==/$server/" config.json
sed -i "s/==YOUR USER ID==/$user/" config.json
sed -i "s/==YOUR ENTRY PATH==/\/$path\//" config.json

read -r -p "Start v2ray now? [y/N] " input
case $input in
  [yY][eE][sS]|[yY])
    echo "Yes"
    /etc/init.d/v2ray start
