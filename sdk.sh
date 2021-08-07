#!/usr/bin/env bash

export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-1.11.0-openjdk-amd64}
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData ${JAVA_OPTIONS}"
export ANDROID_HOME=${HOME}/android/sdk

CMDLINE_TOOLS_VERSION="linux-7583922_latest"
BUILD_TOOLS_VERSION="30.0.3"

# repo
if [ ! -f ${HOME}/bin/repo ]; then
  curl -fLo ${HOME}/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ${$HOME}/bin/repo
fi
PATH=${HOME}/bin:${PATH}

# Check for existing sdk installations.
if [ -d ${ANDROID_HOME} ]; then
  echo "Existing android-sdk ${ANDROID_HOME} found."
  echo "Delete sdk and reinstall it? [Y/n]"
  read YN
  if [ ${YN} == 'n' ]; then
    echo "Exiting."
    exit 1
  elif [ ${YN} == 'Y' ]; then
     rm -rf ${ANDROID_HOME}
     mkdir -p ${ANDROID_HOME}
  else
    echo "Unknown command ${YN}. Aborting."
    exit 1
  fi
fi

# 1. Install cmdline-tools
mkdir -p ${ANDROID_HOME}/cmdline-tools
cd ${ANDROID_HOME}/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-${CMDLINE_TOOLS_VERSION}.zip
echo '124f2d5115eee365df6cf3228ffbca6fc3911d16f8025bebd5b1c6e2fcfa7faf commandlinetools-${CMDLINE_TOOLS_VERSION}.zip' | sha256sum -c
bsdtar xvf commandlinetools-${CMDLINE_TOOLS_VERSION}.zip
rm commandlinetools-${CMDLINE_TOOLS_VERSION}.zip
mv cmdline-tools latest
PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${PATH}

# 2. Install platform-tools
sdkmanager platform-tools
PATH=${ANDROID_HOME}/platform-tools:${PATH}

# 3. Install build-tools
sdkmanager 'build-tools;${BUILD_TOOLS_VERSION}'
PATH=$HOME/android/sdk/build-tools/${BUILD_TOOLS_VERSION}:${PATH}

# 4. Install ndk-bundle
sdkmanager ndk-bundle
PATH=${ANDROID_HOME}/ndk-bundle:${PATH}
export PATH

# Update everything
sdkmanager --update
