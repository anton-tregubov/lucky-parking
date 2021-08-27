#!/bin/bash

cd "$(dirname "$0")"
cd ..

helm uninstall --namespace ${K8S_NAMESPACE} ${APPLICATION_NAME} || echo "There are no needs to cleanup ${APPLICATION_NAME}"
helm install --namespace ${K8S_NAMESPACE} \
             --create-namespace \
             --set backend.image.name=${DOCKER_IMAGE_NAME} \
             --set backend.image.pullPolicy=${DOCKER_IMAGE_PULL_POLICY} \
             --set-file keycloak.realm=./ci/config/realm-export.json \
             --set ingress.tls.enabled=${DOMAIN_SSL_ENABLED} \
             --set ingress.tls.acme.email=${DOMAIN_OWNER_EMAIL} \
             --set ingress.tls.acme.sever=${DOMAIN_OWNER_ACME_SERVER} \
             --set domain=${DOMAIN} \
             --set subdomain=${SUBDOMAIN} \
             --kube-context=${K8S_CONTEXT}\
             ${APPLICATION_NAME} ./src/main/helm/${APPLICATION_NAME}