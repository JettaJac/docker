# #!/bin/bash

# Очистка Кеш докера
docker system prune -f

# Собираем образ из докерфайла
docker build -t nginx:images_5_part .

# Запускаем контейнер
docker run -it -p 80:81 --name part_5 -d nginx:images_5_part bash

# Открываем в браузере 
open http://localhost:80/

# Проверка на доверие содержимому
export DOCKER_CONTENT_TRUST=1

# Запускаем докли, проверяем корректность нашего Докерфайла
dockle --accept-key=NGINX_GPGKEY nginx:images_5_part

# Пауза
echo "Press any key to finish and delete images and containers"
read -sn1 -p "..."; echo


docker images 
docker stop part_5
docker rm part_5
docker rmi -f nginx:images_5_part

