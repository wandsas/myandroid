# envsetup.sh

[ -f ~/.profile ] && . ~/.profile


export JDK8=${HOME}/android/jdk1.8.0_301
export JDK11=${HOME}/android/jdk-11.0.2
export JDK16=${HOME}/android/jdk-16.0.2

export JAVA_HOME=${JDK8}
PATH=${JAVA_HOME}/bin:${PATH}
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData ${JAVA_OPTIONS}"

  # repo cmd
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

# android-sdk
if [ -d $HOME/android/sdk ]; then
  export ANDROID_HOME=${HOME}/android/sdk
  export ANDROID_SDK_ROOT=${ANDROID_HOME}
  export ANDROID_NDK_HOME=${ANDROID_HOME}/ndk-bundle
  PATH=$ANDROID_HOME/cmdline-tools/latest/bin:${PATH}
  PATH=$ANDROID_HOME/platform-tools:${PATH}
  PATH=$ANDROID_HOME/build-tools/30.0.3:${PATH}
  PATH=$ANDROID_HOME/ndk-bundle:${PATH}
  PATH=$ANDROID_HOME/emulator:${PATH}
fi
# emulator
if [ -d $HOME/.android/avd ]; then
  export ANDROID_AVD_HOME=${HOME}/.android/avd
  export LD_LIBRARY_PATH=${HOME}/android/sdk/emulator/lib64:${LD_LIBRARY_PATH}
  export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins
  export QT_DEBUG_PLUGINS=1
  export QT_XCB_FORCE_SOFTWARE_OPENGL=1
  export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
fi
# studio
if [ -d ${HOME}/android/studio ]; then
  PATH=${HOME}/android/studio/bin:${PATH}
fi
# maven
if [ -L ${HOME}/android/apache-maven ]; then
  PATH=${HOME}/android/apache-maven/bin:${PATH}
  export M2_HOME=${HOME}/android/apache-maven
  #export MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"
fi
if [ -L ${HOME}/android/gradle ]; then
  export GRADLE_HOME=${HOME}/android/gradle
  export GRADLE_USER_HOME=${HOME}/.gradle
  PATH=${GRADLE_HOME}/bin:${PATH}
fi
export PATH
