#!/bin/bash

if [ ! -d ~/build/depot_tools ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
    ~/build/depot_tools
fi
export PATH=$HOME/build/depot_tools:$PATH
