#! /bin/bash

CONF_FILE=/etc/kamailio/kamailio-local.cfg

ENV_VARS=`cat $CONF_FILE | grep \#! | cut --complement -b 1-13 | cut -d! -f 1`

for VAR in $ENV_VARS; do
    if [ ! -z "`env | grep ^$VAR=`" ]; then
        VALUE=`env | grep ^$VAR= | cut -d= -f2`
        sed -i "s/\"\!$VAR\!.*\!/\"\!$VAR\!$VALUE\!/" $CONF_FILE
    fi
done
