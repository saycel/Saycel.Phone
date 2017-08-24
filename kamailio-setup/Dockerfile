FROM	saycel/kamailio:latest

ADD	kamctlrc /etc/kamailio/kamctlrc

ADD	kamailio.cfg /etc/kamailio/kamailio.cfg

ADD	kamailio /etc/default/kamailio

ADD	tls.cfg /etc/kamailio/tls.cfg

ENTRYPOINT	["/run.sh"]
