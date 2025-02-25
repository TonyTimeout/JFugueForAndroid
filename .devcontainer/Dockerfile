# Use the specified base image
#FROM mcr.microsoft.com/devcontainers/java:dev-21-jdk-bookworm
FROM alpine

RUN preInitHomeDir
RUN ls -al /home/vscode
RUN postInitHomeDir

## Install essential packages
#RUN apt-get update && apt-get install -y \
#    curl \
#    unzip \
#    wget \
#    locate \
#    emacs-nox \
#    && apt-get clean
#
## Set environment variables for Android SDK
RUN echo prehome $HOME posthome
ARG HOME
ENV HOME=${HOME}
ENV ANDROID_SDK_ROOT=${HOME}/Android/Sdk
# incorrectly showing as: /Android/Sdk ... $HOME not being expanded
RUN echo preSdk ${ANDROID_SDK_ROOT} postSdk
RUN echo prepath1 $PATH postpath1
ENV PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools
RUN echo prepath2 $PATH postpath2
RUN echo prels
RUN ls /
RUN echo postls
#
## Create directory for Android SDK
#RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools
#
## Download and install Android SDK command line tools
#RUN cd ${ANDROID_SDK_ROOT}/cmdline-tools \
#    && wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O commandlinetools.zip \
#    && unzip commandlinetools.zip \
#    && rm commandlinetools.zip
#
## Install Android SDK packages
#RUN yes | ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --licenses \
#    && ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager --update \
#    && ${ANDROID_SDK_ROOT}/cmdline-tools/bin/sdkmanager "platform-tools" \
#    "platforms;android-34" \
#    "build-tools;34.0.0"
#
## Remove existing Gradle installation
#RUN apt-get remove -y gradle
#
## Download the latest Gradle binary
#RUN wget https://services.gradle.org/distributions/gradle-8.12.1-bin.zip -P /tmp
#
## Unzip the downloaded Gradle binary
#RUN unzip -d /opt/gradle /tmp/gradle-8.12.1-bin.zip
#
## Create a symbolic link to the new Gradle version
#RUN ln -s /opt/gradle/gradle-8.12.1 /opt/gradle/latest
#
## Update the PATH environment variable
#ENV PATH=/opt/gradle/latest/bin:$PATH
#
## Add environment variables to .bashrc for interactive shell sessions

# $HOME is /root -- so is written to /root and not to user account
#   -> but root is the wrong account to use so do not suggest /root
#   -> also cannot set "ARG HOME=/root" because /root is wrong account
# problem is I don't know what user account is at this time ... do you Copilot?
RUN echo "export ANDROID_SDK_ROOT=${HOME}/Android/Sdk" >> ${HOME}/.bashrc \
    && echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools" >> ${HOME}/.bashrc \
    && echo "export PATH=/opt/gradle/latest/bin:$PATH" >> ${HOME}/.bashrc
RUN echo preCatBashrc
RUN echo ~
RUN ls ~/.bashrc
RUN echo postCatBashrc
# what is in /home at this point?
RUN echo preHomeDir
RUN ls -ald /home/*
RUN echo midHomeDir
RUN ls /home/vscode || true
RUN echo postHomeDir
