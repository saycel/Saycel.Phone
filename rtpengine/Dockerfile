FROM	debian:8.0

RUN	apt-get update &&\
	apt-get install -y git &&\
	git clone --recursive https://github.com/sipwise/rtpengine.git rtpengine &&\
	cd /rtpengine &&\
	apt-get install -y dpkg-dev &&\
	./debian/flavors/no_ngcp &&\
	apt-get install -y \
	debhelper \
	iptables-dev \
	libavcodec-dev \
 	libavfilter-dev \
	libavformat-dev \
	libavresample-dev \
	libavutil-dev \
	libcurl4-openssl-dev \
	libevent-dev \
	libglib2.0-dev \
	libhiredis-dev \
	libpcap-dev \
	libpcre3-dev \ 
	libssl-dev \ 
	libxmlrpc-core-c3-dev \
	markdown \
	zlib1g-dev &&\
	apt-get install -y \
	libmysqlclient-dev \
	libjson-glib-dev &&\
	cd /rtpengine/ &&\
	dpkg-buildpackage -rfakeroot -us -uc
RUN	ls &&\
	apt-get install -y dkms &&\
	dpkg -i *.deb &&\	
	apt-get -f install
