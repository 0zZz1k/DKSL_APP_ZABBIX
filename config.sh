cd /tmp
if [ -f $(basename -- $ZABBIX_VERSION) ]
then
  apt install ./$(basename -- $ZABBIX_VERSION)
else
  wget $ZABBIX_VERSION
  apt install ./$(basename -- $ZABBIX_VERSION)
fi
#zabbix
apt clean
apt install --download-only -y zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-nginx-conf zabbix-agent
cp /var/cache/apt/archives/*.deb ./iso/netping/deb/zabbix/
cp ./zabbix-release_*_all.deb ./iso/netping/deb/zabbix/
#postgresql 
apt clean
apt install --download-only -y postgresql
cp /var/cache/apt/archives/*.deb ./iso/netping/deb/pgsql

