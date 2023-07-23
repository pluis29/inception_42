all:
	@sudo mkdir -p /home/lpaulo-d/data/wordpress
	@sudo mkdir -p /home/lpaulo-d/data/mariadb
	@echo "127.0.0.1 lpaulo-d.42.fr" | sudo tee --append /etc/hosts
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
		docker rm $$(docker ps -qa);\
		docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker network rm $$(docker network ls -q);\
		sudo rm -rf /home/lpaulo-d/

.PHONY: all re down clean