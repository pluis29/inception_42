#!/bin/sh

wp core download --allow-root

wp core install --allow-root \
					--url=$DOMAIN_NAME \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email

wp user create --allow-root \
					$WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD

# ensuring the socket is present
mkdir -p /run/php/ && touch /run/php/php7.4-fpm.sock
chown -R www-data:www-data /run/php/
chmod -R 777 /var/www/wordpress

exec "$@"