FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx \
	openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/lpaulo-d.crt \
	-keyout /etc/nginx/ssl/lpaulo-d.key \
	-subj "/C=BR/ST=SP/L=SP/O=42brazil/CN=lpaulo-d.42.fr/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir /var/www/html/wordpress

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
