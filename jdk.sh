#!/usr/bin/env bash

JDK17=https://download.java.net/java/early_access/jdk17/30/GPL/openjdk-17-ea+30_linux-x64_bin.tar.gz
JDK17_sum=https://download.java.net/java/early_access/jdk17/30/GPL/openjdk-17-ea+30_linux-x64_bin.tar.gz.sha256
  sha256sum -c
JDK16=https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz
JDK16_sum=https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz.sha256
JDK8=https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_8u302b08.tar.gz
JDK8_SUM=https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u302-b08/OpenJDK8U-jdk_x64_linux_8u302b08.tar.gz.sign

curl -O $JDK16
curl -O $JDK16_sum

echo $(cat $JDK8_sum) $JDK8 | sha256sum
bsdtar -xvf $JDK8
rm $JDK18 $JDK8_sum
export JAVA_HOME=${HOME}/android/jdk-8
export PATH=$JAVA_HOME/bin:${PATH}

