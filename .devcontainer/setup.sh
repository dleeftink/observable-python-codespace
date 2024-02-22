#!/bin/bash

echo 'Please wait for setup to finish ...'
eval "$(micromamba shell hook --shell bash)" 

# get repo

if [ $(find . -maxdepth  1 -type d ! -name . ! -name .devcontainer | wc -l) -eq 0 ]; 
then 

  mv .devcontainer .. 
  git clone "$target_repo" . 
  rm -rf .devcontainer 
  git clean -f -f
  mv ../.devcontainer . 

else 

  echo Contents available :

fi

  micromamba activate 
  micromamba install python -c conda-forge -y

# project dependencies installed via package.json
# and postinstall script

  npm install
