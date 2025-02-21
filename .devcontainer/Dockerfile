# Use the specified base image
FROM mcr.microsoft.com/devcontainers/java:dev-21-jdk-bookworm

# Install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    wget \
    locate \
    emacs-nox \
    && apt-get clean

# Set environment variables for Android SDK
ENV ANDROID_SDK_ROOT=${HOME}/Android/Sdk
ENV PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools

# Create directory for Android SDK
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools

# Download and install Android SDK command line tools
RUN cd ${ANDROID_SDK_ROOT}/cmdline-tools \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O commandlinetools.zip \
    && unzip commandlinetools.zip \
    && rm commandlinetools.zip

# Install Android SDK packages
RUN yes | ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --licenses \
    && ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --update \
    && ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager "platform-tools" \
    "platforms;android-34" \
    "build-tools;34.0.0"

# Remove existing Gradle installation
RUN apt-get remove -y gradle

# Download the latest Gradle binary
RUN wget https://services.gradle.org/distributions/gradle-8.12.1-bin.zip -P /tmp

# Unzip the downloaded Gradle binary
RUN unzip -d /opt/gradle /tmp/gradle-8.12.1-bin.zip

# Create a symbolic link to the new Gradle version
RUN ln -s /opt/gradle/gradle-8.12.1 /opt/gradle/latest

# Update the PATH environment variable
ENV PATH=/opt/gradle/latest/bin:$PATH

# Add environment variables to .bashrc for interactive shell sessions
RUN echo 'export ANDROID_SDK_ROOT=${HOME}/Android/Sdk' >> ~/.bashrc \
    && echo 'export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools' >> ~/.bashrc \
    && echo 'export PATH=/opt/gradle/latest/bin:$PATH' >> ~/.bashrc