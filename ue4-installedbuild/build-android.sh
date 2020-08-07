#!/bin/bash

#### common settings ####
export DOCKERHUB_NAMESPACE="kaeru109"
export DOCKERHUB_REPOSITORY="ue4-installedbuild"

#### Version Settings ####
export UE4_VERSION="4.25.3"
export UBUNTU_VERSION="20.04"
# Android SDK Versions (see ue4-android-sdk)
export OPENJDK_VERSION="8"
export NDK_VERSION="21.1.6352462"
export BUILD_TOOLS_VERSION="30.0.1"

# build image
# tag: kaeru109/ue4-installedbuild:4.25.3-android
docker build \
--tag ${DOCKERHUB_NAMESPACE}/${DOCKERHUB_REPOSITORY}:${UE4_VERSION}-android \
--build-arg UE4_VERSION=${UE4_VERSION} \
--build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
--build-arg OPENJDK_VERSION=${OPENJDK_VERSION} \
--build-arg NDK_VERSION=${NDK_VERSION} \
--build-arg BUILD_TOOLS_VERSION=${BUILD_TOOLS_VERSION} \
--no-cache \
-f ./Dockerfile.android \
.

# push image to dockerhub
docker push ${DOCKERHUB_NAMESPACE}/${DOCKERHUB_REPOSITORY}:${UE4_VERSION}-android