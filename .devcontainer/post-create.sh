#!/bin/bash

# Install essential packages
sudo apt update && sudo apt install -y \
    curl \
    unzip \
    wget \
    locate \
    && sudo apt clean

# Set environment variables for Android SDK
export ANDROID_SDK_ROOT=/usr/local/android-sdk-linux
export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools

# Create directory for Android SDK
sudo mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools

# Download and install Android SDK command line tools
cd ${ANDROID_SDK_ROOT}/cmdline-tools \
    && sudo wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O commandlinetools.zip \
    && sudo unzip commandlinetools.zip \
    && sudo rm commandlinetools.zip

# Install Android SDK packages
yes | sudo ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --licenses \
    && sudo ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --update \
    && sudo ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager "platform-tools" \
    "platforms;android-30" \
    "build-tools;30.0.3"