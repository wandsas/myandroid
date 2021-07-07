#!/bin/bash

GRAPHENEOS_HOME=$HOME/grapheneos

DEVICE=bramble
BUILD_ID=rq3a.210605.005

TARGET_BUILD_TYPE=release
TARGET_PRODUCT=aosp_bramble
TARGET_BUILD_VARIANT=user

cd $HOME/grapheneos
source script/envsetup.sh
choosecombo debug sdk_phone_x86 userdebug

$GRAPHENEOS_HOME/vendor/android-prepare-vendor/execute-all.sh \
    -d $DEVICE \
    -b $BUILD_ID \
    -o $GRAPHENEOS_HOME/vendor/android-prepare-vendor
mkdir -p vendor/google_devices
rm -rf vendor/google_devices/$DEVICE
mv vendor/android-prepare-vendor/$DEVICE/$BUILD_ID/vendor/google_devices/* vendor/google_devices/

