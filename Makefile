PROJECT=${USER}
CONTAINER="${PROJECT}-service_name-1"

attach: start 
	xhost + 
	 docker exec -it "${CONTAINER}" bash

start: build
	XAUTH=/tmp/.docker.xauth
	touch $XAUTH
	xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
	 docker compose -p ${PROJECT} -f ./docker/docker-compose.yml up -d 

build: 
	 docker compose -p ${PROJECT} -f ./docker/docker-compose.yml build

remove: 
	 docker rm ${CONTAINER}
	 docker rmi ${CONTAINER}

stop: 
	 docker stop ${CONTAINER}

