#!/bin/bash

sudo docker rm -f phservers_php71_1 phservers_php55_1 phservers_php56_1 phservers_apache_1

sudo docker rmi phserver:apache phserver:php5.5 phserver:php5.6 phserver:php7.1