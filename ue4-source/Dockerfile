ARG ALPINE_VERSION="3.11.6"

FROM alpine:${ALPINE_VERSION} as builder

ARG UE4_TAG
ARG GIT_REPO="github.com/EpicGames/UnrealEngine.git"

# update dnf and install git
RUN apk update && \
    apk add --no-cache \
    git  && \
    rm -rf /var/lib/apt/lists/*

# git clone unreal engine from official repogitory to /home/ue4/source
# after remove version tracking
RUN git clone --depth=1 --branch=${UE4_TAG} \
    https://${GIT_TOKEN}:x-oauth-basic@${GIT_REPO} \
    /source && \
    rm -rf /source/.git/

# use multi-stage build
FROM alpine:${ALPINE_VERSION}

COPY --from=builder /source /source