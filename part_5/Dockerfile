# echo "jhgfdssgdxfhcgjvhbnkml,"
FROM nginx:latest

HEALTHCHECK --interval=5s --timeout=10s --retries=3 \
CMD curl -sS 127.0.0.1 || exit 1

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.c .
COPY start_5.sh .

RUN apt-get update -y ; \
    apt-get install gcc -y ; \
    apt-get install -y spawn-fcgi  ; \
    apt-get install -y libfcgi-dev ; \
    gcc server.c -lfcgi -o server ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    chmod u-s /usr/bin/gpasswd ; \
    chmod u-s /usr/bin/newgrp ; \
    chmod u-s /bin/su ; \
    chmod u-s /bin/mount ; \
    chmod u-s /bin/umount ; \
    chmod u-s /usr/bin/chsh ; \
    chmod u-s /usr/bin/chfn ; \
    chmod u-s /usr/bin/chsh ; \
    chmod 777 /usr/bin/ld ; \
    chmod 777 /var/run/ ; \
    chmod 777 /var/cache/nginx/ ; \
    chmod u-s usr/bin/passwd ; \
    chmod g-s usr/bin/chage ; \
    chmod g-s sbin/unix_chkpwd ; \
    chmod g-s usr/bin/expiry ; \
    chmod g-s usr/bin/wall ; \
    chmod +x /start_5.sh

USER nginx  

ENTRYPOINT [ "sh", "start_5.sh" ]

