#!/bin/bash

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/perm.crt \
	-keyout /etc/nginx/ssl/perm.key \
	-subj "/C=BR/ST=SP/L=SP/O=42brazil/CN=lpaulo-d.42.fr/"

exec "$@"
