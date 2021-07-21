#!/usr/bin/env bash

VANADIUM_HOME=$HOME/vanadium

# Check if depot_tools available. 
. depot_tools.sh

# Get vanadium source.
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
echo "Configure args.gn and start ninja:"
echo "ninja -C out/Default/ trichrome_webview_64_32_apk trichrome_chrome_64_32_apk trichrome_library_64_32_apk"
