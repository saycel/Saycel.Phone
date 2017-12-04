FROM debian:8.0

ENV	DOMAIN rhizortc.specialstories.org

RUN     echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list &&\
	apt-get update &&\
	apt-get upgrade -y &&\
	apt-get install -y apache2 python-certbot-apache -t jessie-backports

ADD	000-default.conf /etc/apache2/sites-enabled/000-default.conf

ADD	apache2.conf /etc/apache2/apache2.conf

ADD	ports.conf /etc/apache2/ports.conf

ADD	000-default-le-ssl.conf /etc/apache2/sites-enabled/000-default-le-ssl.conf

RUN	a2enmod rewrite &&\
	a2enmod proxy_http &&\
	a2enmod proxy_html &&\
	a2enmod ssl



	 &&\
	apt-get install -y curl &&\ 
	curl -sL https://deb.nodesource.com/setup_6.x | bash - &&\
	apt-get install -y nodejs git &&\
	git clone https://github.com/versatica/tryit-jssip &&\
	cd tryit-jssip/ &&\
	npm install

ADD	index.html tryit-jssip/index.html

RUN     sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /tryit-jssip/index.html

ADD     Phone.jsx tryit-jssip/lib/components/Phone.jsx

RUN	cd tryit-jssip &&\
	npm install -g gulp-cli &&\
	gulp dev &&\ 
	cd out/ &&\
	cp -r * /var/www/html/


CMD ["apache2ctl" , "-D" , "FOREGROUND"]
