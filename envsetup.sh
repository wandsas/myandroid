# envsetup.sh

[ -f ~/.profile ] && source .profile

export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export JAVA_OPTIONS="-Xms2048m -Xmx4096m -XX:-UsePerfData $JAVA_OPTIONS"

  # repo cmd
if [ ! -r ~/bin/repo ]; then
  curl -fLo ~/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ~/bin/repo
fi
PATH=~/bin:$PATH
# depot_tools
if [ ! -d ~/build/depot_tools ]; then
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git \
    ~/build/depot_tools
fi
PATH=$HOME/build/depot_tools:$PATH
# sdk
if [ -d $HOME/android/sdk ]; then
    export ANDROID_HOME=$HOME/android/sdk
    PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
    PATH=$ANDROID_HOME/platform-tools:$PATH
    PATH=$ANDROID_HOME/build-tools/30.0.3:$PATH
    PATH=$ANDROID_HOME/ndk-bundle:$PATH
    PATH=$ANDROID_HOME/emulator:$PATH
fi
# emulator
if [ -d $HOME/.android/avd ]; then
  export ANDROID_AVD_HOME=$HOME/.android/avd
  export LD_LIBRARY_PATH=$HOME/android/sdk/emulator/lib64:$LD_LIBRARY_PATH
  export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins
  export QT_DEBUG_PLUGINS=1
fi
# studio
if [ -d $HOME/android/studio ]; then
  PATH=$HOME/android/studio/bin:$PATH
fi
# maven
if [ -L $HOME/build/apache-maven ]; then
  PATH=$HOME/build/apache-maven/bin:$PATH
  export M2_HOME=$HOME/build/apache-maven
  #export MAVEN_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000"
fi
export PATH
