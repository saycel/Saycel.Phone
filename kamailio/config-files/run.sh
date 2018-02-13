#! /bin/bash

while ! mysqladmin ping -h "mysql" --silent; do
    echo 'Waiting for mysql server on host mysql'
    sleep 1
done

kamdbctl create <<< $MYSQL_ROOT_PASSWORD
./permissions.sh

echo ## using the following custom config to run
cat /etc/kamailio/kamailio-local.cfg

/usr/sbin/kamailio -P /var/run/kamailio/kamailio.pid -f /etc/kamailio/kamailio.cfg -D -E -m 64 -M 8 -u kamailio -g kamailio
