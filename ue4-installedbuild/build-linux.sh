#!/bin/bash

#### common settings ####
export DOCKERHUB_NAMESPACE="kaeru109"
export DOCKERHUB_REPOSITORY="ue4-installedbuild"

#### Version Settings ####
export UE4_VERSION="4.25.3"
export UBUNTU_VERSION="20.04"

# build image
# tag: kaeru109/ue4-installedbuild:4.25.3-linux
docker build \
--tag ${DOCKERHUB_NAMESPACE}/${DOCKERHUB_REPOSITORY}:${UE4_VERSION}-linux \
--build-arg UE4_VERSION=${UE4_VERSION} \
--build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
--no-cache \
-f ./Dockerfile.linux \
.

# push image to docker hub
docker push ${DOCKERHUB_NAMESPACE}/${DOCKERHUB_REPOSITORY}:${UE4_VERSION}-linux