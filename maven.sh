#!/usr/bin/env bash

[ -d $HOME/android ] || mkdir $HOME/android
cd $HOME/android
curl -LO https://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
bsdtar -xvf apache-maven-3.8.1-bin.tar.gz
rm apache-maven-3.8.1-bin.tar.gz
ln -s apache-maven-3.8.1 apache-maven
export M2_HOME=$HOME/android/apache-maven
#export MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"
export PATH=$HOME/android/apache-maven/bin:$PATH
