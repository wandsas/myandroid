#!/bin/bash

# Be aware, script deletes previous vendor files!

DEVICE=bramble
BUILD_ID=rq3a.210605.005

. ~/android/envsetup.sh

cd ~/grapheneos
source script/envsetup.sh

choosecombo release bramble user

~/grapheneos/vendor/android-prepare-vendor/execute-all.sh \
    -d $DEVICE -b $BUILD_ID -o ~/grapheneos/vendor/android-prepare-vendor
mkdir -p ~/grapheneos/vendor/google_devices
rm -rf ~/grapheneos/vendor/google_devices/$DEVICE
mv ~/grapheneos/vendor/android-prepare-vendor/$DEVICE/$BUILD_ID/vendor/google_devices/* ~/grapheneos/vendor/google_devices/


