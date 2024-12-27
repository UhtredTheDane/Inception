
service mariadb start &

sleep 10
mariadb -u root << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown 
echo "coucou"
exec mysqld
