FROM	debian:8.0
LABEL maintainer="Nicolas Pace <nico@libre.ws>"

ARG VERSION=mr5.1.2.1

ADD 	config-files/policy-rc.d /usr/sbin/policy-rc.d

ENV DEBIAN_FRONTEND noninteractive

# Dependencies install
RUN 	apt-get update &&\
        apt-get install -y --no-install-recommends apt-utils &&\
	apt-get install -y git dpkg-dev debhelper iptables-dev libavcodec-dev libavfilter-dev libavformat-dev libavresample-dev libavutil-dev libcurl4-openssl-dev libevent-dev libglib2.0-dev libhiredis-dev libpcap-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev markdown zlib1g-dev dkms module-assistant nfs-common netcat libbencode-perl libcrypt-rijndael-perl libdigest-hmac-perl libio-socket-inet6-perl libsocket6-perl libmysqlclient-dev libjson-glib-dev &&\
        apt-get clean && rm -rf /var/lib/apt/lists/*

# Compile and Install RTPEngine
RUN	git clone --recursive https://github.com/sipwise/rtpengine.git -b $VERSION rtpengine &&\
	cd rtpengine &&\
	./debian/flavors/no_ngcp &&\
	dpkg-buildpackage -rfakeroot -us -uc &&\
        ls
RUN	dpkg -i *.deb &&\
	apt-get -f install

# Config copy
ADD	config-files/rtpengine.conf /etc/rtpengine/rtpengine.conf
ADD	config-files/ngcp-rtpengine-daemon /etc/default/ngcp-rtpengine-daemon
ADD	config-files/run.sh /

RUN	chmod +x /run.sh

ENTRYPOINT	["/run.sh"]
