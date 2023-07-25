FCOMPOSE=./srcs/docker-compose.yml
ENV_FILE=./srcs/.env
VWORDPRESS=/home/lpaulo-d/data/wordpress
VMARIADB=/home/lpaulo-d/data/mariadb
# @echo "127.0.0.1 lpaulo-d.42.fr" | sudo tee --append /etc/hosts

all:
	@sudo mkdir -pv $(VMARIADB)
	@sudo mkdir -pv $(VWORDPRESS)
	@docker-compose -f $(FCOMPOSE) --env-file $(ENV_FILE) up -d --build

down:
	@docker-compose -f $(FCOMPOSE) --env-file $(ENV_FILE) down

clean:
	@docker stop $$(docker ps -qa);\
		docker rm $$(docker ps -qa);\
		docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker network rm $$(docker network ls -q);\
		sudo rm -rf $(VMARIADB)
		sudo rm -rf $(VWORDPRESS)

.PHONY: all down clean
