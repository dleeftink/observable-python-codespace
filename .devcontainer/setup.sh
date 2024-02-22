#!/usr/bin/env bash

echo 'Please wait for setup to finish ...'
eval "$(micromamba shell hook --shell bash )" 

# get repo

if [ $(find . -maxdepth  1 -type d ! -name . ! -name .devcontainer | wc -l) -eq 0 ]; 
then 

# move files selectively 

  mv .devcontainer .. 
  git clone "$target_repo" . 
  
  mv -f ../.devcontainer/devcontainer.json .devcontainer
  rm -rf ../.devcontainer 

# remove cloned and reinstate original .devcontainer folder
# rm -rf .devcontainer 
# git clean -f -f
# mv ../.devcontainer . 

else 

  echo Contents available :

fi

  micromamba activate 
  micromamba install -y -n base -f .devcontainer/env.yaml
  micromamba clean --all --yes

# project dependencies installed via package.json
# and postinstall script

  npm install
