FCOMPOSE=./srcs/docker-compose.yml
ENV_FILE=./srcs/.env
VWORDPRESS=/home/lpaulo-d/data/wordpress
VMARIADB=/home/lpaulo-d/data/mariadb

all:
	@sudo mkdir -pv $(VWORDPRESS)
	@sudo mkdir -pv $(VMARIADB)
	@docker-compose -f $(FCOMPOSE) --env-file $(ENV_FILE) up -d --build

down:
	@docker-compose -f $(FCOMPOSE) --env-file $(ENV_FILE) down

clean:
	@docker stop $$(docker ps -qa);\
		docker rm $$(docker ps -qa);\
		docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker network rm $$(docker network ls -q);\
		sudo rm -rf $(VWORDPRESS)
		sudo rm -rf $(VMARIADB)

.PHONY: all down clean
