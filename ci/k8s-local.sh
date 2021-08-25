#!/bin/sh
set -x

cd "$(dirname "$0")"
cd ..

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: ${K8S_NAMESPACE}
EOF

helm uninstall -n ${K8S_NAMESPACE} lucky-parking
helm install -n ${K8S_NAMESPACE} lucky-parking ./src/main/helm/lucky-parking