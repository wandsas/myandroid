#!/usr/bin/env bash

if [ ! -d ~/android/depot_tools ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
    ~/build/depot_tools
fi
export PATH=$HOME/android/depot_tools:$PATH
