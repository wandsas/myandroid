#!/usr/bin/env bash

[ -d $HOME/android ] || mkdir -p $HOME/android

if [ -L $HOME/android/gradle ]; then
  echo "Existing gradle version found."
  echo "Delete it? [Y/n]"
  read YN
  if [ ${YN} == 'n' ]; then
    echo "Aborting."
    exit 1
  elif [ ${YN} == 'Y' ]; then
    echo "Deleting previous gradle version"
    rm -rf $HOME/android/gradle*
  else
    echo "Unknown argument. Aborting."
    exit 1
  fi
fi

cd $HOME/android
curl -LO https://services.gradle.org/distributions/gradle-7.1.1-all.zip
unzip gradle-7.1.1-all.zip
rm gradle-7.1.1-all.zip
ln -s gradle-7.1.1 gradle

