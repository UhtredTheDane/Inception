FROM debian:buster

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/makeDBUser.sh /makeDBUser.sh
EXPOSE 3306
ENTRYPOINT ["bash", "/makeDBUser.sh"]
