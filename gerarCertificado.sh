#!/bin/bash

if [ ! -e ./ssl/apache.crt ]; then
	mkdir ssl
	openssl req -new -x509 -days 365 -keyout ssl/apache.key -out ssl/apache.crt -nodes -subj  "/O=Teste/OU=TESTE/CN=localhost"
fi
