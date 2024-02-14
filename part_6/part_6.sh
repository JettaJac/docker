#!/bin/bash

cd ../

# Собираем докер компос (проект)
docker-compose build

# Запускаем проект
docker-compose up

open http://localhost:80/

# Останавливает и удаляет контейнеры
# docker-compose down 

# Команда позволяющая выпольнить команду в выполняющемся контейнере
#docker-compose exec (имя)

# Выводим список контейнеров
docker ps

# Выводит список образов
docker images 

# Удаляем и останавливаем контейнер
docker stop src_server_2_1 part_5
docker rm src_server_2_1 part_5 

# Удаляем образ
docker rmi -f src_server_1 nginx

docker ps
docker images 