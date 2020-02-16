zsh-setup:
	# install zinit for installing plugins
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	
	# symlink in this repositories
	ln -s ./zsh/zprofile.zsh $HOME/.zprofile
	ln -s ./zsh/zshrc.zsh $HOME/.zshrc
