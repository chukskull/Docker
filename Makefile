



run =  sudo mkdir -p /home/snagat/data/wp && sudo mkdir -p /home/snagat/data/db && docker-compose up --build 

delete = docker-compose down --volume

clean = docker system prune --all --force --volumes && \
	docker network prune --force && \
	docker volume prune --force && \
	docker volume rm $$(docker volume ls -q) && \
	sudo rm -rf /home/snagat/data/*

r:
	cd ./srcs/ && $(run)
d:
	cd ./srcs/ && $(delete)
c:
	cd ./srcs/ && $(clean)