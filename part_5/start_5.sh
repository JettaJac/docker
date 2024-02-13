#!/bin/bash

service nginx start 

gcc server.c -lfcgi -o server
spawn-fcgi -p 8080 ./server

# nginx -g 'daemon off;'

# serv -s reload
tail -f /dev/null



 
