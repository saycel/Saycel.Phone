#! /bin/bash

# replace setting in configuration files with user defined variables, necessary configurations.
sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /etc/kamailio/*
sed -i "s/kamailio_mysql/kamailio_mysql.saycelphone_default/g" /etc/kamailio/*
sed -i "s/localhost\/kamailio/kamailio_mysql.saycelphone_default\/kamailio/g" /etc/kamailio/*

export PRIVATE_IPV4="${PRIVATE_IPV4:-$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)}"

sed -i "s/127.0.0.1/$PRIVATE_IPV4/g" /etc/kamailio/*
while ! mysqladmin ping -h "kamailio_mysql" --silent; do
    sleep 1
done

kamdbctl create <<< $MYSQL_ROOT_PASSWORD
./permissions.sh
kamctl add webrtc verysecret

service kamailio start
tail -f /dev/null
