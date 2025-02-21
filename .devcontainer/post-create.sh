#!/bin/bash

# Install essential packages
sudo apt update && sudo apt install -y \
    curl \
    unzip \
    wget \
    locate \
    emacs \
    && sudo apt clean

# Set environment variables for Android SDK
export ANDROID_SDK_ROOT=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools

# Add environment variables to ~/.bashrc if not already present
if ! grep -q "ANDROID_SDK_ROOT=${HOME}/Android/Sdk" ~/.bashrc; then
    echo "export ANDROID_SDK_ROOT=${HOME}/Android/Sdk" >> ~/.bashrc
    echo "export PATH=\$PATH:\$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:\$ANDROID_SDK_ROOT/platform-tools" >> ~/.bashrc
fi

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
    "platforms;android-34" \
    "build-tools;34.0.0"
