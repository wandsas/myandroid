#!/usr/bin/env bash

[ -d $HOME/android ] || mkdir -p $HOME/android
cd $HOME/android

TARBALL=

curl -OL https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.22/android-studio-2020.3.1.22-linux.tar.gz
echo '4adb7b9876ed7a59ae12de5cbfe7a402e1c07be915a4a516a32fef1d30b47276
android-studio-ide-193.6626763-linux.tar.gz' | sha256sum -c
bsdtar xvf android-studio-2020.3.1.22-linux.tar.gz
rm android-studio-2020.3.1.22-linux.tar.gz


#curl -OL https://dl.google.com/dl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz
#echo 'f2f82744e735eae43fa018a77254c398a3bab5371f09973a37483014b73b7597 android-studio-ide-193.6626763-linux.tar.gz' | sha256sum -c
#bsdtar xvf android-studio-ide-193.6626763-linux.tar.gz
#rm android-studio-ide-193.6626763-linux.tar.gz
mv android-studio studio
export PATH=${HOME}/android/studio/bin:${PATH}
