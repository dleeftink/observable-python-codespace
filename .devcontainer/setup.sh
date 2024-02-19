echo 'Please wait for setup to finish ...'

  apk update
  apk add coreutils

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

# install python

if [ "$(whoami)" = "root" ]; 
then  
  
  micromamba create -p base python -c conda-forge -y
  export PATH="/opt/conda/envs/base/bin:$PATH"
  
  bash -c \
    'eval "$(micromamba shell hook -s bash )"' \ 
    'micromamba activate base'

  # exec bash 

else 

  micromamba install python -c conda-forge -y

fi

# project dependencies installed via package.json
# and postinstall script

# npm install
# exec bash
