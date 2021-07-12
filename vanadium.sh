#!/bin/bash

# depot_tools
if [ ! -d ~/android/depot_tools ]; then
  cd ~/android
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
else
  cd ~/android/depot_tools
  git pull origin master
  cd ..
fi
PATH=$HOME/android/depot_tools:$PATH

# vanadium
if [ ! -d vanadium ]; then
    git clone git://github.com/GrapheneOS/Vanadium.git vanadium
    cd ~/vanadium
else
    cd ~/vanadium
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
# autoninja -C out/Default chrome_public_apk
