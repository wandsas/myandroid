#!/bin/bash

[ -d ~/chromium ] || mkdir -p ~/chromium
cd ~/chromium

# depot_tools
if [ ! -d ~/chromium/depot_tools ]; then
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
else
    cd depot_tools
    git pull origin master
    cd ..
fi
export PATH=$HOME/chromium/depot_tools:$PATH

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

# get other build targets gn ls out/Default
# //chrome/test:unit_tests use autoninja -C out/Default chrome/test:unit_tests
autoninja -C out/Default chrome_public_apk
