if [ ! -f /var/www/wordpress/wp-config.php ]; then
	sleep 15
	echo 'salut'
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
	echo 'coucou'
	sleep 10
	wp core install --allow-root --url=$WP_SITE --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'
	wp user create --allow-root "$WP_USER" "$WP_USER_EMAIL" --role=author --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress'
fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php
fi

exec php-fpm7.4 -F
