[ -f ~/.profile ] && . ~/.profile

jdk8=/usr/lib/jvm/java-1.8.0-openjdk-amd64
jdk11=/usr/lib/jvm/java-1.11.0-openjdk-amd64
jdk16=/usr/lib/jvm/java-1.16.0-openjdk-amd64

export JAVA_HOME=${jdk11}
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData ${JAVA_OPTIONS}"

# repo
if [ ! -r ${HOME}/bin/repo ]; then
  curl -fLo ${HOME}/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ${HOME}/bin/repo
fi
PATH=${HOME}/bin:${PATH}
# depot_tools
if [ ! -d ${HOME}/android/depot_tools ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
    ${HOME}/android/depot_tools
fi
PATH=${HOME}/android/depot_tools:${PATH}
# Android-Studio
if [ -d ${HOME}/android/studio ]; then
  PATH=${HOME}/android/studio/bin:${PATH}
fi
# Android-SDK
if [ -d ${HOME}/android/sdk ]; then
  export ANDROID_HOME=${HOME}/android/sdk
  export ANDROID_NDK_ROOT=${ANDROID_HOME}/ndk-bundle
  PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${PATH}
  PATH=${ANDROID_HOME}/platform-tools:${PATH}
  PATH=${ANDROID_HOME}/build-tools/30.0.3:${PATH}
  PATH=${ANDROID_NDK_ROOT}:${PATH}
  PATH=${ANDROID_HOME}/emulator:${PATH}
fi
# Android-Emulator
if [ -d ${HOME}/.android/avd ]; then
  export ANDROID_AVD_HOME=${HOME}/.android/avd
  export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
  export LD_LIBRARY_PATH=${HOME}/android/sdk/emulator/lib64:${LD_LIBRARY_PATH}
#  export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins
#  export QT_XCB_FORCE_SOFTWARE_OPENGL=1
#  export QT_DEBUG_PLUGINS=1
fi
export PATH
