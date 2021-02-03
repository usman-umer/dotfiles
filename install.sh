#!/bin/bash

echo "Installing Updates n Stuff..."


# main update
sudo apt update 
sudo apt upgrade -y --allow-downgrades

# extras
sudo apt install figlet
sudo apt install lolcat
sudo apt install vim 
sudo apt install htop
sudo apt install tmux
# symlinks

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}


linkDotfile .vimrc
linkDotfile .tmux.conf



figlet "... updated stuff:-)" | lolcat