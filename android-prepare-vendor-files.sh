#!/bin/bash

# Be aware, script deletes previous vendor files!

DEVICE=bramble
BUILD_ID=rq3a.210605.005

. ${HOME}/android/envsetup.sh

cd ${HOME}/grapheneos
source script/envsetup.sh
choosecombo release bramble user

vendor/android-prepare-vendor/execute-all.sh \
    -d ${DEVICE} \
    -b ${BUILD_ID} \
    -o vendor/android-prepare-vendor

mkdir -p vendor/google_devices
if [ -d vendor/google-devices/${DEVICE} ]; then
  mv vendor/google_devices/${DEVICE} "vendor/google_devices/${DEVICE}.prev-install-$(timestamp)"
fi
mv vendor/android-prepare-vendor/${DEVICE}/${BUILD_ID}/vendor/google_devices/* vendor/google_devices/
