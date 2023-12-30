#!/bin/bash

mkcd() {
	if [ $1 ]; then
		if [ -d $1 ]; then
			cd $1
		else
			mkdir $1 && cd $1
		fi
	else
		read -p "Please enter a directory name: " dirname
		mkcd $dirname
	fi
}

pyvenvcreate() {
  if [ $1 ]; then
    pyenv shell $1
    if [ $2 ]; then
      python -m venv $2
    else
      echo "Please provide a path to place the virtual environment."
    fi
  else
    echo "Please provide a python version to use."
  fi
}
