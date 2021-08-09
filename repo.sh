#!/usr/bin/env bash

if [ ! -f ~/bin/repo ]; then
  curl -fLo ~/bin/repo --create-dirs \
    https://storage.googleapis.com/git-repo-downloads/repo 
  chmod a+x ~/bin/repo
fi
export PATH=~/bin:${PATH}
