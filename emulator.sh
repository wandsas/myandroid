#!/usr/bin/env bash

ANDROID_HOME=${HOME}/android/sdk
ANDROID_BUILD=${HOME}/grapheneos/out/target/product/generic_x86_64

cd ${HOME}/grapheneos
source script/envsetup.sh
choosecombo debug sdk_phone_x86_64 userdebug

emulator \
    -sysdir ${ANDROID_BUILD} \
    -system ${ANDROID_BUILD}/system.img \
    -ramdisk ${ANDROID_BUILD}/ramdisk.img \
    -data ${ANDROID_BUILD}/userdata.img \
    -kernel ${ANDROID_HOME}/system-images/android-30/google_apis/x86/kernel-ranchu-64 \
    -memory 1024 \
    -partition-size 1024


    #-skindir ${ANDROID_HOME}/platforms/android-30/skins \
    #-skin WVGA800 \
