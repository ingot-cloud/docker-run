#!/usr/bin/env bash


docker run -d --name portainer \
 --network ingot-net \
 --restart always \
 -p 9000:9000 \
 -e AGENT_SECRET=123456 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v portainer_data:/data \
 portainer/portainer-ce
