FROM 	debian:8.0

RUN 	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com \
	0xfb40d3e6508ea4c8

ADD 	config-files/kamailio.list /etc/apt/sources.list.d/kamailio.list

ADD 	config-files/policy-rc.d /usr/sbin/policy-rc.d

RUN 	apt-get update &&\
	apt-get install -y \
	kamailio \
	kamailio-mysql-modules \
	kamailio-presence-modules \
	kamailio-tls-modules \
	kamailio-websocket-modules \
	kamailio-sctp-modules \
	kamailio-outbound-modules \
	kamailio-extra-modules

ADD	config-files/kamctlrc /etc/kamailio/kamctlrc

ADD	config-files/kamailio.cfg /etc/kamailio/kamailio.cfg

ADD	config-files/kamailio /etc/default/kamailio

ADD	config-files/tls.cfg /etc/kamailio/tls.cfg

ADD	config-files/permissions.sh /

ADD	config-files/run.sh /

RUN	chmod +x /permissions.sh &&\
	chmod +x /run.sh

ENTRYPOINT	["/run.sh"]
