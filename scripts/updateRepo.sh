#!/usr/bin/env bash

ssh suilabs@suilabs.com <<< "
cd Projects/tarbean
git pull origin master && \
htpasswd -c -b htpasswd/kae.suilabs.com $LC_NGINX_USER $LC_NGINX_PASS
docker-compose up -d --build webPlatform"
