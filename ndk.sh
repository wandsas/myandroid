#!/bin/bash

export ANDROID_HOME=$HOME/android/sdk
export ANDROID_NDK_HOME=$HOME/android/ndk

if [ ! -d $ANDROID_HOME ]; then
    printf "android-sdk not available.\n";
    printf "Please install android-sdk first. Aborting.\n"
    exit 1;
fi

[ -d $HOME/android ] || install -m755 -d $HOME/android
cd $HOME/android
curl -LO https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip
bsdtar -xvf android-ndk-r21e-linux-x86_64.zip
rm android-ndk-r21e-linux-x86_64.zip
mv android-ndk-r21e ndk



