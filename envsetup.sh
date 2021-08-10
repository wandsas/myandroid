[ -f ~/.profile ] && . ~/.profile


jdk8="/home/android/android/jdk1.8.0_301"
jdk11="/home/android/android/jdk-11.0.12"
jdk16="/home/android/android/jdk-16.0.2"
openjdk8="/home/android/android/openlogic-openjdk-8u292-b10-linux-x64"
openjdk11="/home/android/android/openlogic-openjdk-11.0.11+9-linux-x64"

export JAVA_HOME="${openjdk11}"
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData ${JAVA_OPTIONS}"
PATH=${JAVA_HOME}/bin:${PATH}

# repo
if [ ! -r ${HOME}/bin/repo ]; then
  curl -fLo ${HOME}/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ${HOME}/bin/repo
fi
# ~/bin is already in path PATH=${HOME}/bin:${PATH}
# depot_tools
if [ ! -d ${HOME}/android/depot_tools ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
    ${HOME}/android/depot_tools
fi
PATH=${HOME}/android/depot_tools:${PATH}
# Ant
if [ -L ${HOME}/android/apache-ant ]; then
  export ANT_HOME=${HOME}/android/apache-ant
  PATH=${ANT_HOME}/bin:${PATH}
fi
# Gradle
if [ -L ${HOME}/android/gradle ]; then
  export GRADLE_HOME=${HOME}/android/gradle
  export GRADLE_USER_HOME=${HOME}/.gradle
  PATH=${GRADLE_HOME}/bin:${PATH}
fi
# Android-Studio
#if [ -d ${HOME}/android/studio ]; then
#  PATH=${HOME}/android/studio/bin:${PATH}
#fi
# Android-SDK/NDK
if [ -d ${HOME}/android/sdk ]; then
  export ANDROID_HOME=${HOME}/android/sdk
  export ANDROID_NDK_HOME=${ANDROID_HOME}/ndk-bundle
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
