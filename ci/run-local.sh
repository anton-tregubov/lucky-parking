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
export DOMAIN_OWNER_EMAIL=zlo@zlo.com
export DOMAIN_OWNER_ACME_SERVER=https://acme-staging-v02.api.letsencrypt.org/directory
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=admin

./all.sh