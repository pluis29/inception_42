#!/bin/sh

set -x
sleep 10
if [ -f /usr/local/bin/.docker-entrypoint-finished ]; then
	rm -f /usr/local/bin/.docker-entrypoint-finished
	echo "Removed .docker-entrypoint-finished"
fi

if [ -e /etc/php/7.4/fpm/pool.d/www.conf ]; then
	  echo "FastCGI Process Manager config already created"
else

    cat /www.conf.tmpl | envsubst > /etc/php/7.4/fpm/pool.d/www.conf
	chmod 755 /etc/php/7.4/fpm/pool.d/www.conf
fi

if [ -e wp-config.php ]; then
	  echo "Wordpress config already created"
else

    wp config create --allow-root \
        --dbname=$db_name \
        --dbuser=$db_user \
        --dbpass=$db_password \
        --dbhost=$db_host

	chmod 600 wp-config.php
fi


if wp core is-installed --allow-root; then
	  echo "Wordpress core already installed"
else

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
fi

if !(wp user list --field=user_login --allow-root | grep $WP_USER); then

    wp user create --allow-root \
        $WP_USER \
        $WP_EMAIL \
        --role=author \
        --user_pass=$WP_PASSWORD

fi

sed -ie 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' \
/etc/php/7.4/fpm/pool.d/www.conf

chown -R wpg:wpg /var/www/html/*

touch /usr/local/bin/.docker-entrypoint-finished
echo "Created .docker-entrypoint-finished"

exec "$@"
