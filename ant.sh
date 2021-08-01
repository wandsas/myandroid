#!/usr/bin/env bash

[ -d $HOME/android ] || mkdir $HOME/android
cd $HOME/android
curl -LO https://artfiles.org/apache.org//ant/binaries/apache-ant-1.9.16-bin.tar.bz2
bsdtar -xvf apache-ant-1.9.16-bin
rm apache-ant-1.9.16-bin.tar.gz
ln -s apache-ant-1.9.16 apache-maven
export ANT_HOME=$HOME/android/apache-ant
export PATH=$HOME/android/apache-ant/bin:$PATH
