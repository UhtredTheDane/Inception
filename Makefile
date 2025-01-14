# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agengemb <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/18 15:06:25 by agengemb          #+#    #+#              #
#    Updated: 2024/07/18 15:06:27 by agengemb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception
DOCKERCOMPOSE = docker compose -f srcs/docker-compose.yml
DATAPATH = /home/vboxuser/data

all:${NAME}

${NAME}:
	mkdir -p ${DATAPATH}/data-mariadb
	mkdir -p ${DATAPATH}/data-wordpress
	${DOCKERCOMPOSE} build
	${DOCKERCOMPOSE} up

start:
	${DOCKERCOMPOSE} start

stop:
	${DOCKERCOMPOSE} stop

down:
	${DOCKERCOMPOSE} down

clean:
	${DOCKERCOMPOSE} down --rmi all --volumes --remove-orphans
	rm -rf ${DATAPATH}/data-mariadb
	rm -rf ${DATAPATH}/data-wordpress

fclean: clean
	docker system prune -af --volumes

.PHONY: all start stop down re clean fclean
