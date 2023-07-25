#!/bin/sh

set -x
sleep 10
wp config create --allow-root \
	--dbname=$db_database \
	--dbuser=$db_user \
	--dbpass=$db_password \
	--dbhost=$db_host

chmod 600 wp-config.php

wp core install --allow-root \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_email=$WP_ADMIN_EMAIL \
	--admin_password=$WP_ADMIN_PASSWORD

wp user create --allow-root \
	$WP_USER \
	$WP_EMAIL \
	--role=author \
	--user_pass=$WP_PASSWORD

wp config set WORDPRESS_DEBUG false --allow-root

sed -ie 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' \
	/etc/php/7.4/fpm/pool.d/www.conf

chown -R www-data:www-data /var/www/html/*


exec "$@"
