#!/bin/bash

[ -d ~/build ] || mkdir ~/build
cd ~/build
curl -LO https://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
bsdtar -xvf apache-maven-3.8.1-bin.tar.gz
rm apache-maven-3.8.1-bin.tar.gz
ln -s apache-maven-3.8.1 apache-maven
export PATH=$HOME/build/apache-maven/bin:$PATH
