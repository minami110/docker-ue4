#!/bin/bash

#==============================
# Create secret.sh before run thin script.
# echo export GIT_TOKEN=******** | cat > ./secret.sh
#==============================
source ./secret.sh

#=====
# common settings
#====
export NAMESPACE="kaeru109"
export REPOSITORY="ue4-source"
export UE4_VERSION_MAJOR="4"

#====
# build settings
#====
export UE4_VERSION_MINOR="25"
export UE4_VERSION_PATCH="3"

export GIT_REPO="github.com/EpicGames/UnrealEngine.git"
export UE4_TAG="4.25.3-release"

# build image
docker build \
--tag ${NAMESPACE}/${REPOSITORY} \
--build-arg GIT_TOKEN=${GIT_TOKEN} \
--build-arg GIT_REPO=${GIT_REPO} \
--build-arg UE4_TAG=${UE4_TAG} \
--no-cache \
.

# set tags
docker tag \
${NAMESPACE}/${REPOSITORY} \
${NAMESPACE}/${REPOSITORY}:${UE4_VERSION_MAJOR}.${UE4_VERSION_MINOR}

docker tag \
${NAMESPACE}/${REPOSITORY} \
${NAMESPACE}/${REPOSITORY}:${UE4_VERSION_MAJOR}.${UE4_VERSION_MINOR}.${UE4_VERSION_PATCH}