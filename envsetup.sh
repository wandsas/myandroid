# envsetup.sh
export JAVA_HOME=${1:-/usr/lib/jvm/java-1.17.0-openjdk-amd64}
export JAVA_OPTIONS="-Xms1024m -Xmx2048m $JAVA_OPTIONS"
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
# android-studio
if [ -d $HOME/android/studio ]; then
    PATH=$HOME/android/studio/bin:$PATH
fi
# chromium
if [ -d $HOME/chromium/depot_tools ]; then
    PATH=$HOME/chromium/depot_tools:$PATH
fi
export PATH


default_path () {
    PATH="/sbin:/bin:/usr/sbin:/usr/bin/:/usr/local/sbin:/usr/local/bin"
    PATH="$HOME/bin:$HOME/.local/bin:/snap/bin:$PATH"
    export PATH
}
