#!/bin/bash

# Be aware, script deletes previous vendor files!

. ~/android/envsetup.sh
. ~/grapheneos/script/envsetup.sh

DEVICE=bramble
BUILD_ID=rq3a.210605.005

# options: release, debug
TARGET_BUILD_TYPE=debug
# options: aosp_bramble, aosp_walleye
TARGET_PRODUCT=aosp_bramble
# options: user, userdebug
TARGET_BUILD_VARIANT=userdebug

choosecombo $TARGET_BUILD_TYPE $TARGET_PRODUCT $TARGET_BUILD_VARIANT

~/grapheneos/vendor/android-prepare-vendor/execute-all.sh \
    -d $DEVICE \
    -b $BUILD_ID \
    -o ~/grapheneos/vendor/android-prepare-vendor
mkdir -p ~/grapheneos/vendor/google_devices
rm -rf ~/grapheneos/vendor/google_devices/$DEVICE
mv ~/grapheneos/vendor/android-prepare-vendor/$DEVICE/$BUILD_ID/vendor/google_devices/*
~/grapheneos/vendor/google_devices/

