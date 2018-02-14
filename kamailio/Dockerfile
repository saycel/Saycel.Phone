FROM 	debian:8.0
ARG VERSION=32392a7dbbd858b94d277c1f3d5376bbdaa6a60c

# Adds Kamailio repositories.
RUN 	apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xfb40d3e6508ea4c8
ADD 	config-files/kamailio.list /etc/apt/sources.list.d/kamailio.list
ADD 	config-files/policy-rc.d /usr/sbin/policy-rc.d

# Installs dependencies.
RUN 	apt-get update &&\
	apt-get install -y \
        curl \
	kamailio \
	kamailio-mysql-modules \
	kamailio-presence-modules \
	kamailio-tls-modules \
	kamailio-websocket-modules \
	kamailio-sctp-modules \
	kamailio-outbound-modules \
	kamailio-extra-modules \
	kamailio-utils-modules &&\
        apt-get clean && rm -rf /var/lib/apt/lists/*

# Adds Config files
ADD	config-files/kamctlrc /etc/kamailio/kamctlrc
ADD	config-files/permissions.sh /
ADD	config-files/run.sh /
ADD	config-files/customize-config.sh /
RUN     cd /tmp; curl -sL https://github.com/saycel/kamailio-config/archive/$VERSION.tar.gz | tar xvfz -; cp /tmp/kamailio-config-*/* /etc/kamailio/

RUN	chmod +x /permissions.sh && chmod +x /run.sh &&\
        mv /etc/kamailio/kamailio-local.cfg.sample /etc/kamailio/kamailio-local.cfg &&\
        ./customize-config.sh

EXPOSE 5060
EXPOSE 5061/tcp
EXPOSE 5080/tcp
EXPOSE 880/tcp
EXPOSE 8443/tcp
ENTRYPOINT	["/run.sh"]
