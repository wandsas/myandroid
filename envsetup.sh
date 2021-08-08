[ -f ~/.profile ] && . ~/.profile

jdk8=/home/android/android/jdk1.8.0_301
jdk16=/home/android/android/jdk-16.0.2

export JAVA_HOME=${jdk16}
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData ${JAVA_OPTIONS}"
PATH=${JAVA_HOME}/bin:${PATH}

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
# Gradle
#if [ -L ${HOME}/android/gradle ]; then
#  export GRADLE_HOME=${HOME}/android/gradle
#  export GRADLE_USER_HOME=${HOME}/.gradle
#  PATH=${GRADLE_HOME}/bin:${PATH}
#fi
# Android-Studio
#if [ -d ${HOME}/android/studio ]; then
#  PATH=${HOME}/android/studio/bin:${PATH}
#fi
# Android-SDK/NDK
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
