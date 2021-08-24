#!/bin/sh
set -x

cd "$(dirname "$0")"
cd ..

mvn clean package \
    -Dquarkus.container-image.build=true \
    -Dquarkus.container-image.image=${IMAGE_NAME}
