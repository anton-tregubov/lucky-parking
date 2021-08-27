#!/bin/bash
set -x

cd "$(dirname "$0")"

export DOCKER_IMAGE_REPOSITORY=local
export DOCKER_IMAGE_PUSH=false
export DOCKER_IMAGE_PULL_POLICY=Never
source ./run-common.sh
export K8S_NAMESPACE=${APPLICATION_NAME}-local
export K8S_CONTEXT=docker-desktop
export DOMAIN=docker.internal
export DOMAIN_SSL_ENABLED=false
export SUBDOMAIN=kubernetes
export OWNER_EMAIL=zlo@zlo.com

./all.sh