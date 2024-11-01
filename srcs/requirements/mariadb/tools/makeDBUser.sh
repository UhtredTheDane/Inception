
if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	echo "Database already exists"
else

service mariadb start;
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mariadb -e "SET PASSWORD FOR 'root'@'localhost'= PASSWORD('${SQL_ROOT_PASSWORD}');"
	mariadb -e "FLUSH PRIVILEGES;"

	chmod 755 /run/mysqld/mysqld.sock
	while [ ! -e /run/mysqld/mysqld.sock ]; do
		echo "MariaDB is still starting up.."
		sleep 2
	done

echo "coucou"
kill $(cat /var/run/mysql/mysqld.pid)
fi
echo "toto"
exec mysqld
