#!/bin/sh
set -x

cd "$(dirname "$0")"

export K8S_NAMESPACE=lucky-parking-local
export IMAGE_NAME=lucky-parking:latest

sh ./image-local.sh