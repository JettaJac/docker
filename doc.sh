#!/bin/bash

docker ps
docker pull nginx
docker run -d --name nas -p 81:81 nginx 

docker ps
docker cp nginx.conf nas:/etc/nginx/
docker cp server.c nas:/

docker exec -it nas apt-get update
# docker exec -it nas bash

# apt update
apt install gcc -y
apt install spawn-fcgi -y
apt install libfcgi-dev -y

gcc server.c -lfcgi -o server
spawn-fcgi -p 8080 ./server
nginx -s reload

exit
open http://localhost:81/
docker stop nas
docker rm nas
# docker rmi -f nginx