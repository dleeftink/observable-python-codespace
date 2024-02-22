#!/bin/bash

echo 'Please wait for setup to finish ...'
eval "$(micromamba shell hook --shell bash)" 

# get repo

if [ $(find . -maxdepth  1 -type d ! -name . ! -name .devcontainer | wc -l) -eq 0 ]; 
then 

  mv .devcontainer .. 
  git clone "$target_repo" . 
# rm -rf .devcontainer 
# git clean -f -f
# mv ../.devcontainer . 
  mv -f ../.devcontainer/devcontainer.json .devcontainer

else 

  echo Contents available :

fi

  micromamba activate 
  micromamba install -y -n base -f .devcontainer/env.yaml
  micromamba clean --all --yes

# project dependencies installed via package.json
# and postinstall script

  npm install
