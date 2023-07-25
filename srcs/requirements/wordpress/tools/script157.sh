# #!/bin/sh

# sleep 5

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	&& chmod +x wp-cli.phar \
# 	&& mv wp-cli.phar /usr/local/bin/wp

# wp	core download --allow-root
# # rm -f /var/www/html/wp-config.php
# # cp ./wp-config.php /var/www/html/wordpress/wp-config.php

# # /usr/local/bin/wp	core install --allow-root --path="/var/www/html/wordpress" \
# # 					--url=${DOMAIN_NAME} \
# # 					--title=${WP_TITLE} \
# # 					--admin_user=${WP_ADMIN_USER} \
# # 					--admin_password=${WP_ADMIN_PASSWORD} \
# # 					--admin_email=${WP_ADMIN_EMAIL} \

# # /usr/local/bin/wp	user create --allow-root --path="/var/www/html/wordpress" \
# # 					${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD}

# # # ensuring the socket is present
# # mkdir -p /run/php/ && touch /run/php/php7.4-fpm.sock
# # chown -R www-data:www-data /run/php/
# # chmod -R 777 /var/www/html

# # wp core config --allow-root \
# # --dbname=$db_databse \
# # --dbuser=$db_user \
# # --dbpass=$db_password \
# # --dbhost=$db_host

# # chmod 600 wp-config.php
# # cp ./wp-config.php /var/www/html/wordpress/wp-config.php

# wp core install --allow-root \
# 	--url=$DOMAIN_NAME \
# 	--title=$WP_TITLE \
# 	--admin_user=$WP_ADMIN_USER \
# 	--admin_email=$WP_ADMIN_EMAIL \
# 	--admin_password=$WP_ADMIN_PASSWORD

# wp user create --allow-root \
# 	$WP_USER \
# 	$WP_EMAIL \
# 	--role=author \
# 	--user_pass=$WP_PASSWORD


# sed -ie 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' \
# 	/etc/php/7.4/fpm/pool.d/www.conf

# chown -R www-data:www-data /var/www/html/*

# exec "$@"

