FROM	linuxmaniac/pkg-kamailio-docker:jessie

ENV	DOMAIN rhizortc.specialstories.org

ADD	run.sh /

RUN	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com \ 
	0xfb40d3e6508ea4c8 &&\
	chmod +x ./run.sh

ADD	kamailio.list /etc/apt/sources.list.d/kamailio.list

ADD	policy-rc.d /usr/sbin/policy-rc.d

RUN	apt-get update &&\
	apt-get install -y \
	kamailio \
	kamailio-mysql-modules \
	kamailio-presence-modules \
	kamailio-tls-modules \
	kamailio-websocket-modules

ADD	kamctlrc /etc/kamailio/kamctlrc

ADD	kamailio.cfg /etc/default/kamailio.cfg

ADD	kamailio /etc/default/kamailio

RUN	sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /etc/kamailio/*

ENTRYPOINT	["/run.sh"]
