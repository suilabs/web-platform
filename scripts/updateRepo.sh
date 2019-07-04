#!/usr/bin/env bash

LC_PROJECT_NAME=webPlatform
ssh -tt -o StrictHostKeyChecking=no suilabs@suilabs.com <<< "mkdir -p Projects/${LC_PROJECT_NAME}; exit" && \
rsync -rpulz --verbose ${PWD}/../* suilabs@suilabs.com:./Projects/${LC_PROJECT_NAME}/. && \
ssh -tt -o SendEnv=PROJECT_NAME -o StrictHostKeyChecking=no suilabs@suilabs.com <<< "
cd Projects/${LC_PROJECT_NAME}
htpasswd -c -b htpasswd/kae.suilabs.com $LC_NGINX_USER $LC_NGINX_PASS
docker-compose up -d --build webPlatform
exit"
