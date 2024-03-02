#!/usr/bin/env bash

echo 'Please wait for setup to finish ...'
eval "$(micromamba shell hook --shell bash )" 

# get repo

if [ $(find . -maxdepth  1 -type d ! -name . ! -name .devcontainer | wc -l) -eq 0 ]; 
then 

# move devcontainer.json selectively 

  temp_dev=$(mktemp -d)
  
  mv .devcontainer "$temp_dev"
  git clone "$target_repo" . 
  
  mv -f "$temp_dev/.devcontainer/devcontainer.json" .devcontainer
  rm -rf "$temp_dev/.devcontainer"
  
# alternative: remove cloned and reinstate user .devcontainer folder

# rm -rf .devcontainer 
# git clean -f -f
# mv "$temp_dev/.devcontainer" . 

else 

  echo Contents available :

fi

  micromamba activate 
  micromamba install -y -n base -f .devcontainer/env.yaml
  micromamba clean --all --yes

# project dependencies installed via package.json
# and devcontainer postAttachCommand for decoupled image/package dependencies
# note: use packgage.json postinstall instead to 'couple' installation

  npm install
