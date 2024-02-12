FROM nginx:latest

COPY server.c /
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /

RUN apt-get update -y && \
    apt-get install gcc -y && \
    apt-get install -y spawn-fcgi  && \
    apt-get install -y libfcgi-dev && \
    gcc server.c -lfcgi -o server && \

    chmod +x /start.sh


ENTRYPOINT [ "sh", "./start.sh" ]