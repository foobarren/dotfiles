install: install-zsh install-vim install-gitignore

install-zsh:
	ln -fs `pwd`/zshrc ~/.zshrc

install-vim:
	ln -fs `pwd`/vimrc ~/.vimrc

install-gitignore:
	ln -fs `pwd`/gitignore ~/.gitignore
