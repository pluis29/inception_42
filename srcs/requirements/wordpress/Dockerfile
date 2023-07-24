FROM debian:bullseye

ARG	WORDPRESS_VERSION=5.8.3

RUN apt-get update && apt-get install -y \
	php \
	php-fpm \
	php-mysql \
	php-gd \
	php-opcache \
	php-cli \
	php-curl \
	php-mbstring \
	wget \
	apt-utils \
	unzip

WORKDIR /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	--output-document=/usr/local/bin/wp \
  && chmod +x /usr/local/bin/wp

# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php
RUN chown -R www-data:www-data /var/www/wordpress \
	&& chmod -R 777 /var/www/wordpress
# RUN sed -i 's/listen\s*=\s*.*/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]