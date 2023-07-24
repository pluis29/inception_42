FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx \
	openssl \
	gettext-base

RUN mkdir /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/wordpress.conf.template

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT [ "script.sh" ]

CMD ["nginx", "-g", "daemon off;"]
