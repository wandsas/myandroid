# envsetup_x86_64.sh

export JAVA_HOME=${1:-/usr/lib/jvm/java-1.17.0-openjdk-amd64}
export JAVA_OPTIONS="-Xms1024m -Xmx2048m $JAVA_OPTIONS"

export ANDROID_SDK_HOME=$HOME/android/sdk
export ANDROID_NDK_HOME=$HOME/android/ndk
export ANDROID_STANDALONE_TOOLCHAIN_HOME=$HOME/android/toolchain/android-toolchain-x86_64-4.9-android-24
export SYSROOT=$ANDROID_STANDALONE_TOOLCHAIN_HOME/sysroot

PATH=${ANDROID_NDK_HOME}
PATH=$PATH:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/platform-tools
PATH=$PATH:${ANDROID_STANDALONE_TOOLCHAIN_HOME}/bin:/usr/local/sbin:/usr/local/bin
PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=$PATH

export BUILD_TARGET_HOST=x86_64-linux-android
export AR=$BUILD_TARGET_HOST-ar
export AS=$BUILD_TARGET_HOST-clang
export CC=$BUILD_TARGET_HOST-clang
export CXX=$BUILD_TARGET_HOST-clang++
export LD=$BUILD_TARGET_HOST-ld
export STRIP=$BUILD_TARGET_HOST-strip
export RANLIB=$BUILD_TARGET_HOST-ranlib

export CFLAGS="-fPIE -fPIC --sysroot=$SYSROOT"
export LDFLAGS="-pie"

# SELinux specifics
BASEDIR=$(pwd)
export ANDROID_LIBS="$BASEDIR/../android-libs/x86_64"
export CFLAGS="$CFLAGS -I$ANDROID_LIBS/include"
export LDFLAGS="$LDFLAGS -L$ANDROID_LIBS/lib"
