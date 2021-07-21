#!/usr/bin/env bash

if [ ! -f $HOME/bin/repo ]; then
  curl -fLo $HOME/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x $HOME/bin/repo
fi
export PATH=~/bin:${PATH}
