#! /bin/bash

export MY_IP_ADDRESS="${PRIVATE_IPV4:-$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)}"
cp /etc/kamailio/kamailio-local.cfg.buildtime /etc/kamailio/kamailio-local.cfg
./customize-config.sh /etc/kamailio/kamailio-local.cfg

while ! mysqladmin ping -h "mysql" --silent; do
    echo 'Waiting for mysql server on host mysql'
    sleep 1
done

kamdbctl create <<< $MYSQL_ROOT_PASSWORD
./permissions.sh

/usr/sbin/kamailio -P /var/run/kamailio/kamailio.pid -f /etc/kamailio/kamailio.cfg -D -E -m 64 -M 8 -u kamailio -g kamailio
