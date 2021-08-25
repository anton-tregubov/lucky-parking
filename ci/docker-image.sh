#!/bin/bash

cd "$(dirname "$0")"
cd ..

#-Dnative -Dquarkus.native.container-build=true -Dquarkus.native.builder-image=quay.io/quarkus/ubi-quarkus-native-image:21.1.0-java16

mvn clean package \
    -Dquarkus.container-image.build=true \
    -Dquarkus.container-image.push=${DOCKER_IMAGE_PUSH} \
    -Dquarkus.container-image.registry= \
    -Dquarkus.container-image.group=${DOCKER_IMAGE_REPOSITORY}
