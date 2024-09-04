
DIR = ~/data

all: $(DIR)
	docker-compose -f ./srcs/docker-compose.yml up -d

build: $(DIR)
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

$(DIR):
	mkdir ~/data
	mkdir ~/data/mariadb
	mkdir ~/data/wordpress 

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: down
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

clean: down
	docker system prune -a

fclean: down
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force

kill: fclean
	sudo rm -rf ~/data/mariadb/*
	sudo rm -rf ~/data/wordpress/*

.PHONY : all build down re clean fclean kill
