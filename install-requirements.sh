#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y dist-upgrade
# Install android requirements:
sudo apt-get install -y openjdk-11-jdk openjdk-17-jdk \
  git gpg python3 curl zip unzip bison flex patch rsync xz-binutils \
  bash-completion openssl libssl-dev ncurses-base ncurses-bin \
  make gcc automake pkg-config autoconf automake diffutils \
  signify-openbsd libarchive-tools gperf libpulse0 libxcb-xinerama0
# Install vanadium requirements:
sudo apt-get install -y libpci3:i386 libx11-xcb1:i386 linux-libc-dev:i386 \
  apache2-bin binutils binutils-aarch64-linux-gnu binutils-arm-linux-gnueabihf \
  binutils-mips64el-linux-gnuabi64 binutils-mipsel-linux-gnu bzip2 cdbs \
  dbus-x11 devscripts dpkg-dev elfutils fakeroot flex g++-10-multilib lib32gcc-s1 \
  lib32stdc++6 libapache2-mod-php7.4 libappindicator3-1 libappindicator3-dev \
  libasound2 libasound2-dev libatk1.0-0 libatspi2.0-0 libatspi2.0-dev libbluetooth-dev \
  libbrlapi-dev libbrlapi0.8 libbz2-1.0 libbz2-dev libc6 libc6-dev libc6-i386 libcairo2 \
  libcairo2-dev libcap-dev libcap2 libcups2 libcups2-dev libcurl4-gnutls-dev libdrm-dev \
  libdrm2 libelf-dev libevdev-dev libevdev2 libexpat1 libffi-dev libffi7 libfontconfig1 \
  libfreetype6 libgbm-dev libgbm1 libglib2.0-0 libglib2.0-dev libglu1-mesa-dev libgtk-3-0 \
  libgtk-3-dev libinput-dev libinput10 libjpeg-dev libkrb5-dev libnspr4 libnspr4-dev libnss3 \
  libnss3-dev libpam0g libpam0g-dev libpango-1.0-0 libpci-dev libpci3 libpcre3 libpixman-1-0 \
  libpng16-16 libpulse-dev libpulse0 libsctp-dev libspeechd-dev libspeechd2 libsqlite3-0 \
  libsqlite3-dev libstdc++6 libudev-dev libudev1 libuuid1 libva-dev libvulkan-dev libvulkan1 \
  libwayland-egl1-mesa libwww-perl libx11-6 libx11-xcb1 libxau6 libxcb1 libxcomposite1 libxcursor1 \
  libxdamage1 libxdmcp6 libxext6 libxfixes3 libxi6 libxinerama1 libxkbcommon-dev libxrandr2 \
  libxrender1 libxshmfence-dev libxslt1-dev libxss-dev libxt-dev libxtst-dev libxtst6 locales \
  mesa-common-dev p7zip perl php7.4-cgi pkg-config python-is-python2 python-setuptools python2-dev \
  rpm ruby snapcraft subversion uuid-dev wdiff x11-utils xcompmgr xz-utils zip zlib1g
# Install google protobuf:
pip install --upgrade protobuf google
# When protoc compiler in protobuf fails in vendor/android-prepare-vendor
# uninstall and reinstall protobuf google 
# pip uninstall protobuf google
# pip install protobuf google
