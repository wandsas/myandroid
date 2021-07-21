#!/bin/bash

curl -O https://download.java.net/java/early_access/jdk17/30/GPL/openjdk-17-ea+30_linux-x64_bin.tar.gz
curl -O https://download.java.net/java/early_access/jdk17/30/GPL/openjdk-17-ea+30_linux-x64_bin.tar.gz.sha256
echo $(cat openjdk-17-ea+30_linux-x64_bin.tar.gz.sha256) openjdk-17-ea+30_linux-x64_bin.tar.gz |
  sha256sum -c
bsdtar -xvf openjdk-17-ea+30_linux-x64_bin.tar.gz
rm openjdk-17-ea+30_linux-x64_bin.tar.gz openjdk-17-ea+30_linux-x64_bin.tar.gz.sha256
export JAVA_HOME=${HOME}/android/jdk-17
export PATH=$JAVA_HOME/bin:${PATH}

