#!/bin/bash

. depot_tools.sh

VANADIUM_HOME=$HOME/vanadium

# vanadium
if [ ! -d $VANADIUM_HOME ]; then
    git clone git://github.com/GrapheneOS/Vanadium.git $VANADIUM_HOME
fi
cd $VANADIUM_HOME
fetch --nohooks android
cd src
echo "target_os = [ 'android' ]" >> ../.gclient
gclient sync -D --with_branch_heads --with_tags --jobs 12
build/install-build-deps-android.sh
gclient runhooks
gn args out/Default

# get other build targets gn ls out/Default
# //chrome/test:unit_tests use autoninja -C out/Default chrome/test:unit_tests
# autoninja -C out/Default chrome_public_apk
