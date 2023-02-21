auto-color-ls() {
	emulate -L zsh
	echo
	exa -F
}

chpwd_functions=(auto-color-ls $chpwd_functions)
