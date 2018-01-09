#! /bin/bash
rtpengine_ip=$(ping -c 1 rtpengine)
rtpengine_ip_1=$(awk -F')' '{print $1}' <<< $rtpengine_ip)
rtpengine_ip_2=$(awk -F'(' '{print $2}' <<< $rtpengine_ip_1)
sed -i "s/127.0.0.1/$rtpengine_ip_2/g" /etc/rtpengine/rtpengine.conf
service ngcp-rtpengine-daemon start
#tail -f /dev/null
