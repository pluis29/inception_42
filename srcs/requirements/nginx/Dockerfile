FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx \
	openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/tempo.crt \
	-keyout /etc/nginx/ssl/tempo.key \
	-subj "/C=BR/ST=SP/L=SP/O=42brazil/CN=lpaulo-d.42.fr/"

RUN mkdir /var/www/html/wordpress

CMD ["nginx", "-g", "daemon off;"]
