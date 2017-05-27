#!/bin/bash

sh gerarCertificado.sh

sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${http_proxy} -t phserver:apache apache/.
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${http_proxy} -t phserver:php5.5 php5.5/.
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${http_proxy} -t phserver:php5.6 php5.6/.
sudo docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${http_proxy} -t phserver:php7.1 php7.1/.
