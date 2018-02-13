FROM debian:8.0

ARG VERSION=alpha0.1.0-180212
ENV	DOMAIN rhizortc.specialstories.org

# Package Install
RUN	apt-get update &&\
        apt-get install -y curl &&\
	curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN	apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y nodejs git apache2 curl

# Apache config
ADD	000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD	apache2.conf /etc/apache2/apache2.conf
ADD	ports.conf /etc/apache2/ports.conf
RUN	a2enmod rewrite &&\
	a2enmod proxy_http &&\
	a2enmod proxy_html

ADD webph.one-$VERSION.tar.gz /var/www/html/

RUN     sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /var/www/html/main.*.bundle.js

EXPOSE 80/tcp
CMD ["apache2ctl" , "-D" , "FOREGROUND"]
