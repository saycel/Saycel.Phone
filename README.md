# Saycel.Phone

**Uses**

[linuxmaniac/pkg-kamailio-docker](https://github.com/linuxmaniac/pkg-kamailio-docker)

[Mysql](https://hub.docker.com/_/mysql/)

[jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)

[Jrcs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)


**Setup**

You will need to setup a domain to use with this application 
(GoDaddy, Dynadot). After setting up a domain you can point it to 
your server of choice (AWS, DigitalOcean).
*Setting up of a domain and a server for use is beyond the scope 
of this application*

**Usage**

To clone this repository

> git clone https://github.com/saycel/Saycel.Phone.git


Make sure to switch to the 'testing' branch for now. _Will be 
changed in the future once stable._

> cd Saycel.Phone/
> git checkout testing


You will need to modify the following files with your Domain 
specific information. All these files will contain variables for 
ease of use.

- .env
- webserver/Dockerfile
