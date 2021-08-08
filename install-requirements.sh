#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install openjdk-17-jdk curl zip unzip bison flex \
    libssl-dev xz-utils bash-completion git python3 gpg rsync \
    diffutils ncurses-base ncurses-bin openssl signify-openbsd \
    libpulse0 libxcb-xinerama0 make gcc automake pkg-config \
    autoconf automake libarchive-tools gperf

pip install --upgrade protobuf google
# When protoc compiler in protobuf fails in vendor/android-prepare-vendor
# uninstall and reinstall protobuf google 
# pip uninstall protobuf google
# pip install protobuf google
