FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php \ 
	php-fpm \
	php-mysql \
    php-gd \
    php-curl \
    php-zip \
    php-json \
    php-xml \
    php-redis \
    openssl \
    php-mbstring \
    php-intl \
    vim \
    curl \
    wget

# WORKDIR /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	--output-document=/usr/local/bin/wp \
#   	&& chmod +x /usr/local/bin/wp

# RUN mkdir -pv /run/php /var/www/wordpress \
# 	&& chmod -R 777 /var/www/wordpress

# # RUN sed -i 's/listen\s*=\s*.*/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# RUN wp core download --allow-root --path="/var/www/wordpress"

# COPY tools/script.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/script.sh

# ENTRYPOINT [ "script.sh" ]
# RUN chown -R www-data:www-data /var/www/wordpress \
# 	&& chmod -R 777 /var/www/wordpress
# EXPOSE 9000

# CMD ["php-fpm7.4", "-F"]

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	--output-document=/usr/local/bin/wp \
#   && chmod +x /usr/local/bin/wp

# RUN mkdir -pv /run/php /var/www/html/wordpress \
#   && chmod -R 755 /var/www/html/

# # COPY ./conf/www.conf /www.conf.tmpl

# WORKDIR /var/www/html/wordpress

# RUN wp core download --allow-root

# COPY tools/script.sh /usr/local/bin/

# RUN chmod +x /usr/local/bin/script.sh

# # RUN rm -f /etc/php/7.4/fpm/pool.d/www.conf

# ENTRYPOINT [ "script.sh" ]

# CMD [ "/usr/sbin/php-fpm7.4", "-F" ]

# FROM debian:bullseye

# ARG	WORDPRESS_VERSION=5.8.3

# RUN apt-get update && apt-get install -y \
# 	php \
# 	php-fpm \
# 	php-mysql \
# 	php-gd \
# 	php-opcache \
# 	php-cli \
# 	php-curl \
# 	php-mbstring \
# 	wget \
# 	apt-utils \
# 	unzip

# WORKDIR /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	--output-document=/usr/local/bin/wp \
#   && chmod +x /usr/local/bin/wp

# # COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
# RUN mkdir /run/php
# RUN chown -R www-data:www-data /var/www/wordpress \
# 	&& chmod -R 777 /var/www/wordpress
# # RUN sed -i 's/listen\s*=\s*.*/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# COPY tools/script.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/script.sh

# ENTRYPOINT [ "/usr/local/bin/script.sh" ]

# EXPOSE 9000

# CMD ["php-fpm7.4", "-F"]

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY    ./conf/wp-config.php .
COPY    ./tools/script.sh .   

RUN		mkdir -p /var/www/html/wordpress
RUN		chmod 777 -R /var/www/html/wordpress
RUN		chown -R www-data:www-data /var/www/html/wordpress

RUN     chmod +x ./script.sh 

ENTRYPOINT ["./script.sh"]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]