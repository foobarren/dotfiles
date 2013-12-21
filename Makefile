# wget https://raw.github.com/luin/dotfiles/master/Makefile -O - | make -- install
master=git://github.com/luin/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.luin_dotfiles

all: install
install: download zsh vim

install-vim: download vim
install-zsh: download zsh

download:
	@rm -rf $(dest)
	git clone $(master) $(dest)

zsh:
	ln -fs $(dest)/zshrc ~/.zshrc

vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/.vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +BundleInstall +qall
	@mkdir -p ~/.vim/undo
