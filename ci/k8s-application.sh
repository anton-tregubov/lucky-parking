#!/bin/bash

cd "$(dirname "$0")"
cd ..

TLS_VARIABLES=""
if [[ ! -z "${DOMAIN_TLS_SECRET_NAME}" ]]; then
   TLS_VARIABLES="${TLS_VARIABLES} --set ingress.tls.secretName=${DOMAIN_TLS_SECRET_NAME}"
   TLS_VARIABLES="${TLS_VARIABLES} --set-file ingress.tls.certificate=./ci/tls/certificate.crt"
   TLS_VARIABLES="${TLS_VARIABLES} --set-file ingress.tls.key=./ci/tls/private.key"
fi

helm uninstall --namespace ${K8S_NAMESPACE} ${APPLICATION_NAME} || echo "There are no needs to cleanup ${APPLICATION_NAME}"
helm install --namespace ${K8S_NAMESPACE} \
             --create-namespace \
             --set backend.image.name=${DOCKER_IMAGE_NAME} \
             --set backend.image.pullPolicy=${DOCKER_IMAGE_PULL_POLICY} \
             --set-file keycloak.realm=./ci/config/realm-export.json \
             ${TLS_VARIABLES} \
             --set domain=${DOMAIN} \
             --set subdomain=${SUBDOMAIN} \
             ${APPLICATION_NAME} ./src/main/helm/${APPLICATION_NAME}