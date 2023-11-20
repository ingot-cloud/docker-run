#!/usr/bin/env bash


currentPath=`cd $(dirname $0);pwd -P`


VIRTUAL_HOST=minio.ingotcloud.top
VIRTUAL_PORT=5001

minio_version=2023.11.15
default_user=admin
default_user_pwd=12345678

mkdir -p /ingot-data/docker/volumes/minio/data
mkdir -p /ingot-data/docker/volumes/minio/config

docker run --name minio \
     --network ingot-net --ip 172.88.0.150 \
     -p 5000:9000 \
     -d --restart=always \
     -e VIRTUAL_HOST=${VIRTUAL_HOST} \
     -e VIRTUAL_PORT=${VIRTUAL_PORT} \
     -e MINIO_ROOT_USER=${default_user} \
     -e MINIO_ROOT_PASSWORD=${default_user_pwd} \
     -v /ingot-data/docker/volumes/minio/data:/bitnami/minio/data \
     bitnami/minio:${minio_version}
