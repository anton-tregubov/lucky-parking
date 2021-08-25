#!/bin/bash

export APPLICATION_NAME=lucky-parking
export APPLICATION_VERSION=$(grep -m 1 -Eo '<version>[^<]*' ./../pom.xml | sed -e 's/<version>//' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
export DOCKER_IMAGE_NAME=${DOCKER_IMAGE_REPOSITORY}/${APPLICATION_NAME}:${APPLICATION_VERSION}