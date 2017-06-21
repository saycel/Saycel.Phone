FROM	debian:8.0

RUN	apt-get update &&\
	apt-get install -y wget &&\
	wget https://github.com/sipwise/rtpengine/archive/mr5.1.2.1.tar.gz &&\
	mkdir rtpengine &&\
	mv mr5.1.2.1.tar.gz rtpengine/ &&\
	cd rtpengine/ &&\
	tar xzvf mr5.1.2.1.tar.gz &&\
	cd rtpengine-mr5.1.2.1/ &&\
	apt-get install -y dpkg-dev &&\
	./debian/flavors/no_ngcp

RUN	dpkg-buildpackage -rfakeroot -us -uc &&\
	apt-get install -y debhelper iptables-dev libavcodec-dev libavfilter-dev libavformat-dev libavresample-dev libavutil-dev &&\
	apt-get install -y libcurl4-openssl-dev libevent-dev libglib2.0-dev libhiredis-dev &&\
	apt-get install -y libpcap-dev libpcre3-dev libssl-dev libxmlrpc-c3-dev markdown zlib1g-dev
