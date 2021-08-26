#!/bin/bash
set -x

cd "$(dirname "$0")"

export DOCKER_IMAGE_REPOSITORY=local
export DOCKER_IMAGE_PUSH=false
export DOCKER_IMAGE_PULL_POLICY=Never
source ./run-common.sh
export K8S_NAMESPACE=${APPLICATION_NAME}-local
export DOMAIN=docker.internal
export SUBDOMAIN=kubernetes
export DOMAIN_TLS_SECRET_NAME=

./all.sh