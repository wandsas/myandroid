#!/usr/bin/env bash

GRADLE_VERSION=7.1.1

GRADLE_HOME=${HOME}/android/gradle

if [ -n ${GRADLE_HOME} ]; then
  echo "Existing GRADLE_HOME install found."
  echo "Delete GRADLE_HOME and reinstall it? [Y/n]"
  read YN
  if [ ${YN} == 'n' ]; then
    echo "Exiting.";
    exit 1
  elif [ ${YN} == 'Y' ]; then
    rm -rf ${GRADLE_HOME}
    mkdir -p ${GRADLE_HOME}
  else
    echo "Unknown command ${YN}. Aborting."
    exit 1
  fi
fi

if 
https://services.gradle.org/distributions/gradle-7.1.1-all.zip
https://services.gradle.org/distributions/gradle-7.1.1-all.zip.sha256
