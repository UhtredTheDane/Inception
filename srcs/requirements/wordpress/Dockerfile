FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt -y install wget
RUN apt install -y php7.4-fpm php-mysql mariadb-client netcat sendmail
RUN wget https://fr.wordpress.org/wordpress-6.6.1-fr_FR.tar.gz -P /var/www
EXPOSE 9000
RUN cd /var/www && tar -xzf wordpress-6.6.1-fr_FR.tar.gz && rm wordpress-6.6.1-fr_FR.tar.gz
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress
RUN chmod 777 /var/www/wordpress
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir -p /run/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown www-data:www-data /usr/local/bin/wp

COPY tools/start_config.sh start_config.sh

RUN chmod 777 /start_config.sh
ENTRYPOINT ["bash", "/start_config.sh"] 
