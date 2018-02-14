#!/bin/bash

sed -i "s/rhizortc.specialstories.org/$DOMAIN/g" /var/www/html/main.*.bundle.js
apache2ctl -D FOREGROUND
