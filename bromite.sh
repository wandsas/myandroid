#!/bin/bash

# depot_tools
. depot_tools.sh

# bromite
if [ ! -d ~/chromium/bromite ]; then
    git clone git://github.com/bromite/bromite.git bromite
    cd bromite
else
    cd bromite
    git pull origin master
fi

fetch --nohooks android
cd src
echo "target_os = [ 'android' ]" >> ../.gclient
gclient sync
build/install-build-deps-android.sh
gclient runhooks
gn args out/Default
# autoninja -C out/Default chrome/test:unit_tests
# autoninja -C out/Default chrome_public_apk
