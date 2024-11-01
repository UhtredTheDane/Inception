FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y
RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/makeDBUser.sh /makeDBUser.sh
EXPOSE 3306
ENTRYPOINT ["bash", "/makeDBUser.sh"]
