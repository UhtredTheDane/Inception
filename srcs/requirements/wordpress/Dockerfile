FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt -y install wget
RUN apt install -y php7.4 php-fpm php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.6.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6.1-fr_FR.tar.gz && rm wordpress-6.6.1-fr_FR.tar.gz
