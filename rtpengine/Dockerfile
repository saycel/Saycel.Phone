FROM	saycel/rtpengine:latest

ADD	rtpengine.conf /etc/rtpengine/rtpengine.conf

ADD	ngcp-rtpengine-daemon /etc/default/ngcp-rtpengine-daemon

ADD	run.sh /

RUN	chmod +x /run.sh

ENTRYPOINT	["/run.sh"]
