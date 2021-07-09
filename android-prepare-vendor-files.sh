#!/bin/bash

# Be aware, script deletes previous vendor files!

AOSP_HOME=$HOME/grapheneos

DEVICE=bramble
BUILD_ID=rq3a.210605.005

# options: release, debug
TARGET_BUILD_TYPE=debug
# options: aosp_bramble, aosp_walleye
TARGET_PRODUCT=aosp_bramble
# options: user, userdebug
TARGET_BUILD_VARIANT=userdebug

source $AOSP_HOME/script/envsetup.sh

choosecombo $TARGET_BUILD_TYPE $TARGET_PRODUCT $TARGET_BUILD_VARIANT

$AOSP_HOME/vendor/android-prepare-vendor/execute-all.sh \
    -d $DEVICE \
    -b $BUILD_ID \
    -o $AOSP_HOME/vendor/android-prepare-vendor
mkdir -p $AOSP_HOME/vendor/google_devices
rm -rf $AOSP_HOME/vendor/google_devices/$DEVICE
mv $AOSP_HOME/vendor/android-prepare-vendor/$DEVICE/$BUILD_ID/vendor/google_devices/*$AOSP_HOME/vendor/google_devices/
