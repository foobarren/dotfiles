# wget https://raw.github.com/luin/dotfiles/master/Makefile -O - | make -- install
master=git://github.com/foobarren/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.foobarren_dotfiles

all: install
install: download install-zsh install-vim

vim: download install-vim
zsh: download install-zsh

download:
	@rm -rf $(dest)
	git clone $(master) $(dest)

install-zsh:
	ln -fs $(dest)/zshrc ~/.zshrc

install-vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/.vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +NeoBundleInstall +qall
	@mkdir -p ~/.vim/undo
