FROM	linuxmaniac/pkg-kamailio-docker:jessie

RUN	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xfb40d3e6508ea4c8

ADD	kamailio.list /etc/apt/sources.list.d/kamailio.list

RUN	apt-get update &&\
	apt-get install -y kamailio kamailio-mysql-modules \
	kamailio-presence-modules kamailio-tls-modules

ADD	kamctlrc /etc/kamailio/kamctlrc

ADD	kamailio.cfg /etc/default/kamailio.cfg

ADD	kamailio /etc/default/kamailio

CMD	bash
