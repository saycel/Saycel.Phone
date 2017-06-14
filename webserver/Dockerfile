FROM debian:8.0

RUN     echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list &&\
	apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y apache2 python-certbot-apache -t jessie-backports

ADD	000-default.conf /etc/apache2/sites-enabled/000-default.conf	

ADD	apache2.conf /etc/apache2/apache2.conf

RUN	a2enmod rewrite

CMD ["apache2ctl" , "-D" , "FOREGROUND"]
