#!/bin/bash

# Собираем образ из  докерфайла
docker build -t nginx .  

# Собираем образ из докерфайла
docker run -p 80:81 --name nas -d nginx bash

# Открываем в браузере
open http://localhost:80/

# Пауза
echo "Press any key to finish and delete images and containers"
read -sn1 -p "..."; echo

docker stop nas
docker rm nas
docker rmi -f nginx

# docker exec -it nas bash