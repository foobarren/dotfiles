# wget https://raw.github.com/luin/dotfiles/master/Makefile -O - | make -- install
master=git://github.com/foobarren/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.foobarren_dotfiles

all: install
install: download install-zsh install-vim install-pip

vim: download install-vim
zsh: download install-zsh
pip: install-pip

download:
	@rm -rf $(dest)
	git clone $(master) $(dest)

install-pip:
	@curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
	sudo python get-pip.py
    #sudo pip install isort

install-zsh:
	ln -fs $(dest)/zshrc ~/.zshrc

install-vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/.vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +NeoBundleInstall +qall
	@mkdir -p ~/.vim/undo
