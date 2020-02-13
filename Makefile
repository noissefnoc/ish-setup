create-user:
	adduser -s /bin/zsh noissefnoc

zsh-setup:
	ln -s ./zsh/zprofile.zsh $HOME/.zprofile
	ln -s ./zsh/zshrc.zsh $HOME/.zshrc
