#! /bin/bash
sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /etc/kamailio/*
sed -i "s/138.68.99.252/$DOMAIN_IP/g" /etc/kamailio/*
sed -i "s/localhost\/kamailio/kamailio_mysql\/kamailio/g" /etc/kamailio/*
service kamailio start
tail -f /dev/null
