#!/bin/bash

cd "$(dirname "$0")"

./docker-image.sh \
&& ./k8s-application.sh