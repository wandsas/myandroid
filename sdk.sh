#!/bin/sh

export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/openjdk-17}
export JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:-UsePerfData $JAVA_OPTIONS"
export ANDROID_HOME=$HOME/android/sdk

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install openjdk-17-jdk curl zip unzip bison flex \
    libssl-dev xz-utils bash-completion git python3 gpg rsync \
    diffutils ncurses-base ncurses-bin openssl signify-openbsd \
    libpulse0 libxcb-xinerama0 make gcc automake pkg-config \
    autoconf automake libarchive-tools gperf
pip install protobuf

if [ ! -f $HOME/bin/repo ]; then
  curl -fLo $HOME/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ~/bin/repo
fi
PATH=~/bin:$PATH

if [ -d $ANDROID_HOME ]; then
  echo "Existing android-sdk $ANDROID_HOME found."
  echo "Delete sdk and reinstall it? [Y/n]"
  read YN
  if [ ${YN} == 'n' ]; then
    echo "Exiting."
    exit 1
  elif [ ${YN} == 'Y' ]; then
     rm -rf $ANDROID_HOME
     mkdir -p $ANDROID_HOME
  else
    echo "Unknown command ${YN}. Aborting."
    exit 1
  fi
fi

# 1. Install cmdline-tools
mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
echo '7a00faadc0864f78edd8f4908a629a46d622375cbe2e5814e82934aebecdb622 commandlinetools-7302050_latest.zip' | sha256sum -c
bsdtar xvf commandlinetools-linux-7302050_latest.zip
rm commandlinetools-linux-7302050_latest.zip
mv cmdline-tools latest
PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

# 2. Install platform-tools
sdkmanager platform-tools
PATH=$ANDROID_HOME/platform-tools:$PATH

# 3. Install build-tools
sdkmanager 'build-tools;30.0.3'
PATH=$HOME/android/sdk/build-tools/30.0.3:$PATH

# 4. Install ndk-bundle
sdkmanager ndk-bundle
PATH=$ANDROID_HOME/ndk-bundle:$PATH
export PATH

# Update everything.
sdkmanager --update
