#!/bin/bash -
#title       :git_update_config.sh
#description :This is script that configures a "git update" method. Useful to projects with git submodule, not only pulling from the main repository as fetching submodules changes.
#author      :André Augusto Tissot
#date        :2016-12-12
#version     :1.0
#usage       :bash git_update_config.sh
#license     :MIT

PROJECT_DIR=`pwd`
git submodule init
git submodule update

COMMAND="update = \"!git pull;git submodule init;git submodule foreach git fetch origin master;git submodule update\""

echo -e "\n"
if ! grep -q "$COMMAND" "$PROJECT_DIR/.git/config"; then
  echo -e "\n[alias]\n\t$COMMAND" | sed -e "s/\\\\\[/[/g" | sed -e "s/\\\\\]/]/g" >> "$PROJECT_DIR/.git/config"
  echo "Now you can use 'git update' to both 'git pull' and 'git submodule update'."
  echo "Agora você pode usar o 'git update' para executar ambos 'git pull' e 'git submodule update'."
else
  echo "Nothing to do."
  echo "Nada a fazer."
fi
