#!/bin/bash

export PATH_WWW_PHP55="/var/www/php55/"
export PATH_WWW_PHP56="/var/www/php56/"
export PATH_WWW_PHP71="/var/www/php71/"

sudo docker rm -f phservers_php71_1 phservers_php55_1 phservers_php56_1 phservers_apache_1

docker-compose up -d --build
