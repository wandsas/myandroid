#!/usr/bin/env bash

ANDROID_SDK_LINUX=${HOME}/android/sdk
ANDROID_BUILD_OUT=${HOME}/grapheneos/out
ANDROID_BUILD=${ANDROID_BUILD_OUT}/android/target/product/generic_x86_64

${ANDROID_SDK_LINUX}/tools/emulator \
    -sysdir ${ANDROID_BUILD} \
    -system ${ANDROID_BUILD}/system.img \
    -ramdisk ${ANDROID_BUILD}/ramdisk.img \
    -data ${ANDROID_BUILD}/userdata.img \
    -kernel ${ANDROID_SDK_LINUX}/system-images/android-30/google_apis/x86/kernel-ranchu-64 \
export M2_HOME=$HOME/build/apache-maven
export MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"
    -skindir ${ANDROID_SDK_LINUX}/platforms/android-18/skins \
    -skin WVGA800 \
    -scale 0.7 \
    -memory 512 \
    -partition-size 1024
