function mkcd {
	if [ $1 ]; then
		if [ -d $1 ]; then
			cd $1
		else
			mkdir $1 && cd $1
		fi
	else
		echo "mkcd requires a single parameter with the folder name to create and enter."
	fi
}
