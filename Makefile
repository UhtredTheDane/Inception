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
DATAPATH = /home/vboxuser

all:${NAME}

${NAME}:
	mkdir -p ${DATAPATH}/data-mariadb
	mkdir -p ${DATAPATH}/data-wordpress
	${DOCKERCOMPOSE} build
	${DOCKERCOMPOSE} up

clean:
	rm -rf ${DATAPATH}/data-mariadb
	rm -rf ${DATAPATH}/data-wordpress
	${DOCKERCOMPOSE} down
	docker volume rm `docker volume ls -q`;

fclean: clean

.PHONY: all clean fclean
