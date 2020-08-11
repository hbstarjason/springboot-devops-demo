#!/usr/bin/env bash



set -e

CONTAINER_NAME=$1
[[ "${CONTAINER_NAME}" == "" ]] && exit 1

docker ps | grep -e ${CONTAINER_NAME} | awk '{print $1}' | xargs docker stop
docker ps -a | grep -e ${CONTAINER_NAME} | awk '{print $1}' | xargs docker rm
