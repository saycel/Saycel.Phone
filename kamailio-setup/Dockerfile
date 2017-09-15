FROM	saycel/kamailio:latest

ADD	kamctlrc /etc/kamailio/kamctlrc

ADD	kamailio.cfg /etc/kamailio/kamailio.cfg

ADD	kamailio /etc/default/kamailio

ADD	tls.cfg /etc/kamailio/tls.cfg

ADD	permissions.sh /

ADD	run.sh

RUN	chmod +x /permissions.sh &&\
	chmod +x /run.sh

ENTRYPOINT	["/run.sh"]
