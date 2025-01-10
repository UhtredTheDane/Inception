sleep 10
cd /var/www/wordpress
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp core download --path='/var/www/wordpress' --allow-root
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
	until wp db check --allow-root --path='/var/www/wordpress'; do
		echo "Waiting for MariaDB to be ready..."
		sleep 5
	done
	wp core install --allow-root --url=$WP_SITE --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'
	wp user create --allow-root "$WP_USER" "$WP_USER_EMAIL" --role=author --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress'
fi
if [ ! -d /run/php ]; then
	mkdir -p /run/php
fi
/usr/sbin/php-fpm7.4 -F
