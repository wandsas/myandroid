# envsetup.sh
export JAVA_HOME=${1:-/usr/lib/jvm/java-1.17.0-openjdk-amd64}
export JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:-UsePerfData $JAVA_OPTIONS"
export QT_DEBUG_PLUGINS=1
# repo
PATH=~/bin:$PATH

# android/sdk
if [ -d $HOME/android/sdk ]; then
    export ANDROID_HOME=$HOME/android/sdk
    PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
    PATH=$ANDROID_HOME/platform-tools:$PATH
    PATH=$ANDROID_HOME/build-tools/30.0.3:$PATH
    PATH=$ANDROID_HOME/ndk-bundle:$PATH
    PATH=$ANDROID_HOME/emulator:$PATH
fi
if [ -d "$HOME/android/sdk/ndk-bundle" ]; then
  export ANDROID_SDK_ROOT=$HOME/android/sdk
  export ANDROID_NDK_ROOT=$HOME/android/ndk
  export ANDROID_AVD_HOME=$HOME/.android/avd
  export LD_LIBRARY_PATH=$HOME/android/sdk/emulator/lib64:$LD_LIBRARY_PATH
  export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins
fi

# android-studio
if [ -d $HOME/android/studio ]; then
    PATH=$HOME/android/studio/bin:$PATH
fi
# chromium depot_tools
if [ -d $HOME/android/depot_tools ]; then
    PATH=$HOME/android/depot_tools:$PATH
fi
export PATH



default_path () {
    PATH="/sbin:/bin:/usr/sbin:/usr/bin/:/usr/local/sbin:/usr/local/bin"
    PATH="$HOME/bin:$HOME/.local/bin:/snap/bin:$PATH"
    export PATH
}
