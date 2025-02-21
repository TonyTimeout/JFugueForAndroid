#!/bin/bash

# Install essential packages
apt update && apt install -y \
    curl \
    unzip \
    wget \
    && apt clean

# Set environment variables for Android SDK
export ANDROID_SDK_ROOT=/usr/local/android-sdk-linux
export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools

# Download and install Android SDK command line tools
mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools \
    && cd ${ANDROID_SDK_ROOT}/cmdline-tools \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O commandlinetools.zip \
    && unzip commandlinetools.zip \
    && rm commandlinetools.zip

# Install Android SDK packages
yes | sdkmanager --licenses \
    && sdkmanager --update \
    && sdkmanager "platform-tools" \
    "platforms;android-30" \
    "build-tools;30.0.3"
