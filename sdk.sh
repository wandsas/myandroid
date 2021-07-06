#!/bin/sh

export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/openjdk-17}
export ANDROID_HOME=$HOME/android/sdk

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install openjdk-17-jdk curl zip unzip bison flex \
    libssl-dev xzutils bash-completion git python3 gpg rsync \
    diffutils ncurses-base ncurses-bin openssl signify-openbsd \
    libpulse0 libxcb-xinerama0 make gcc automake pkg-config \
    autoconf automake xz-utils
pip install protobuf

[ -d $ANDROID_HOME ] || install -m 755 -d $ANDROID_HOME

# Install android's repo command.
if [ ! -d $ANDROID_HOME/bin ]; then
    curl -fLOs $ANDROID_HOME/bin/repo --create-dirs \
        https://storage.googleapis.com/git-repo-downloads/repo-1
    chmod a+x $ANDROID_HOME/bin/repo
fi

# 1. Install cmdline-tools
[ -d $ANDROID_HOME/cmdline-tools ] || mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
echo '7a00faadc0864f78edd8f4908a629a46d622375cbe2e5814e82934aebecdb622 commandlinetools-7302050_latest.zip' | sha256sum -c
unzip commandlinetools-linux-7302050_latest.zip
rm commandlinetools-linux-7302050_latest.zip
mv tools latest
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
#sdkmanager 'cmdline-tools;latest'

# 2. Install platform-tools
sdkmanager platform-tools
export PATH=$ANDROID_HOME/platform-tools:$PATH

# 3. Install build-tools
sdkmanager 'build-tools;30.0.3'
export PATH=$HOME/android/sdk/build-tools/30.0.3:$PATH

# 4. Install ndk-bundle
sdkmanager ndk-bundle
export PATH=$ANDROID_HOME/ndk-bundle:$PATH

# Update everything.
sdkmanager --update
