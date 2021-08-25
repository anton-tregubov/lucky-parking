#!/bin/bash

cd "$(dirname "$0")"
cd ..

helm uninstall --namespace ${K8S_NAMESPACE} ${APPLICATION_NAME} || echo "There are no needs to cleanup ${APPLICATION_NAME}"
helm install --namespace ${K8S_NAMESPACE} \
             --create-namespace \
             --set backend.image.name=${DOCKER_IMAGE_NAME} \
             --set ingress.tls.secretName=${DOMAIN_TLS_SECRET_NAME} \
             --set domain=${DOMAIN} \
             ${APPLICATION_NAME} ./src/main/helm/${APPLICATION_NAME}