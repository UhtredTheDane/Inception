FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt -y install wget
RUN apt install -y php7.4 php-fpm php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.6.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6.1-fr_FR.tar.gz && rm wordpress-6.6.1-fr_FR.tar.gz
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress
#COPY conf/wp-config.php /var/www/wordpress
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY tools/start_config.sh /start_config.sh
RUN chmod 755 /start_config.sh
ENTRYPOINT ["bash", "/start_config.sh"] 
