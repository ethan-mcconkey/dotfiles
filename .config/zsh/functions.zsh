#!/bin/zsh

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

update_zsh_plugins() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github

  if [[ -d $HOME/.config/zsh/plugins ]]; then
    rm -rf $HOME/.config/zsh/plugins/
    if [[ -f $HOME/.config/zsh/plugins.zsh ]]; then
      source $HOME/.config/zsh/plugins.zsh
    else
      echo "Unable to source \"plugins.zsh\""
    fi
  else 
    if [[ -f $HOME/.config/zsh/plugins.zsh ]]; then
      source $HOME/.config/zsh/plugins.zsh
    else
      echo "Unable to source \"plugins.zsh\""
    fi
  fi

  exec zsh
}
