#!/usr/bin/env bash

GRADLE_VERSION="7.1.1-bin"
GRADLE_SHA256SUM_VERSION="226eb2078eef78fbbe86c17bf05d7dedb5411946ff8f590fbc926d5322311d14"
GRADLE_HOME=${HOME}/android/gradle
GRADLE_USER_HOME=${GRADLE_USER_HOME}

if [ -L ${GRADLE_HOME} ]; then
  echo "Existing GRADLE_HOME install found."
  echo "Delete GRADLE_HOME and reinstall it? [Y/n]"
  read YN
  if [ ${YN} == 'n' ]; then
    echo "Exiting.";
    exit 1
  elif [ ${YN} == 'Y' ]; then
    rm -rf ${GRADLE_HOME}
  else
    echo "Unknown command ${YN}. Aborting."
    exit 1
  fi
fi

cd ${HOME}/android
curl -LO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}.zip
echo 226eb2078eef78fbbe86c17bf05d7dedb5411946ff8f590fbc926d5322311d14 gradle-${GRADLE_VERSION}.zip | sha256sum -
bsdtar -xvf gradle-7.1.1-bin.zip
rm gradle-7.1.1-bin.zip
ln -s gradle-7.1.1-bin gradle
