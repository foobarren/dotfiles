# wget https://raw.github.com/luin/dotfiles/master/Makefile -O - | make -- install
master=git://github.com/luin/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.luin_dotfiles_tmp

all: install
install: download _install-zsh _install-vim
	@rm -rf $(dest)
	@rm -rf $(dest)

install-vim: download _install-vim
install-zsh: download _install-zsh

download:
	@rm -rf $(dest)
	git clone --recursive -q $(master) $(dest)

_install-zsh:
	ln -fs $(dest)/zshrc ~/.zshrc

_install-vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/.vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +BundleInstall +qall
	@mkdir -p ~/.vim/undo
	@cp -r $(dest)/snipmate-snippets/snippets ~/.vim/bundle/snipmate-snippets
