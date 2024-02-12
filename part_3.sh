
#!/bin/bash

# Проверяем есть ли запушенные контейнеры
docker ps

# Скачиваем образ инджинкс
docker pull nginx

# Запускаем контейнер с именем nas на 81 порту
docker run -d --name nas -p 81:81 nginx 

# Копируем наш файл нджинкс и сервер в контейнер
docker cp nginx.conf nas:/etc/nginx/
docker cp server.c nas:/

# Скачиваем различные требуемые  утилы в контейнер
docker exec -it nas apt-get update -y
# docker exec -it nas bash
# apt update
docker exec -it nas apt install gcc -y
docker exec -it nas apt install spawn-fcgi -y
docker exec -it nas apt install libfcgi-dev -y
docker exec -it nas gcc server.c -lfcgi -o server
docker exec -it nas spawn-fcgi -p 8080 ./server
docker exec -it nas nginx -s reload
# exit

# Открываем в браузере
open http://localhost:81/

echo "Press any key to finish and delete images and containers"
read -sn1 -p "..."; echo

docker stop nas
docker rm nas
docker rmi -f nginx