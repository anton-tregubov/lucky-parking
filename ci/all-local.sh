#!/bin/sh
set -x

cd "$(dirname "$0")"

export K8S_NAMESPACE=lucky-parking-local
export IMAGE_TAG=latest
export IMAGE_NAME=lucky-parking:${IMAGE_TAG}

sh ./image-local.sh \
&& sh ./k8s-local.sh