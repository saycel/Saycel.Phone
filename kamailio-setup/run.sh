#! /bin/bash

# replace setting in configuration files with user defined variables, necessary configurations.
sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /etc/kamailio/*
sed -i "s/kamailio_mysql/kamailio_mysql.saycelphone_default/g" /etc/kamailio/*
sed -i "s/localhost\/kamailio/kamailio_mysql.saycelphone_default\/kamailio/g" /etc/kamailio/*
# find ping for rtpengine and insert into config files.
rtpengine_ip=$(ping -c 1 rtpengine)
rtpengine_ip_1=$(awk -F')' '{print $1}' <<< $rtpengine_ip)
rtpengine_ip_2=$(awk -F'(' '{print $2}' <<< $rtpengine_ip_1)
sed -i "s/127.0.0.1/$rtpengine_ip_2/g" /etc/kamailio/*
while ! mysqladmin ping -h "kamailio_mysql" --silent; do
    sleep 1
done
kamdbctl create <<< $MYSQL_ROOT_PASSWORD
./permissions
kamctl add webrtc verysecret
service kamailio start
tail -f /dev/null
