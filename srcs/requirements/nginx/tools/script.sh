#!/bin/bash

cat /etc/nginx/wordpress.conf.template | envsubst '$DOMAIN_NAME' > /etc/nginx/sites-available/wordpress.conf

unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/perm.crt \
	-keyout /etc/nginx/ssl/perm.key \
	-subj "/C=BR/ST=SP/L=SP/O=42brazil/CN=lpaulo-d.42.fr/"

exec "$@"
