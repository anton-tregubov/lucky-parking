#!/bin/bash

if [[ ${DOMAIN_TLS_SECRET_NAME} ]]; then
  echo "Create TLS secret"
  kubectl delete secret --namespace $NAMESPACE -l name=${DOMAIN_TLS_SECRET_NAME} || echo "There are no needs to cleanup TLS secret"
  kubectl create secret tls ${DOMAIN_TLS_SECRET_NAME} \
    --namespace ${K8S_NAMESPACE} \
    --cert=./tls/certificate.crt \
    --key=./tls/private.key
else
    echo "No need TLS secret"
fi
