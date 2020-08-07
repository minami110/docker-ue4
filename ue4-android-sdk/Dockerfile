#=================================================
# STAGE: android-sdk
# Android SDK を管理する commandlinetools をダウンロードする
# このアプリケーションの実行には, JAVAが必要なので, openjdkイメージを使用している
# googleからダウンロードしているが, 仕様が変わるとダウンロードできない可能性がある.
#=================================================

ARG OPENJDK_VERSION

FROM openjdk:${OPENJDK_VERSION}-alpine AS android-sdk

ARG ANDROID_COMMANDLINE_TOOLS
ARG ANDROID_BUILD_TOOLS
ARG ANDROID_NDK
ARG ANDROID_PLATFORMS

# update dnf and install git
RUN apk update && \
    apk add --no-cache \
    wget \
    unzip

# Install Android commandlinetools
ENV REPO_OS_OVERRIDE="linux" \
    ANDROID_HOME=/sdk
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    wget --quiet --output-document=/tmp/android-sdk.zip \
    https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_COMMANDLINE_TOOLS}_latest.zip && \
    unzip -q -d ${ANDROID_HOME}/cmdline-tools /tmp/android-sdk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin

# sdk-toolsのlicensesに同意する,
# 最初にこれをやっておくと,パッケージのインストールでライセンスの確認がいらない
RUN yes | sdkmanager --licenses >/dev/null

# sdkmanagerを使用してパッケージをインストールする
RUN sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" && \
    sdkmanager "ndk;${ANDROID_NDK}" && \
    sdkmanager "platform-tools" && \
    sdkmanager "platforms;android-${ANDROID_PLATFORMS}"

# use multi-stage build
FROM alpine:3.11.6

COPY --from=android-sdk /sdk /sdk