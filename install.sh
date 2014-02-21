#!/usr/bin/env bash

# wget https://raw.github.com/luin/dotfiles/master/Makefile -O - | make -- install

master="git://github.com/foobarren/dotfiles.git"
vundle="git://github.com/gmarik/vundle.git"
destpath=`echo ~`
dest=${destpath}/.foobarren_dotfiles

function download {
	rm -rf ${dest}
	git clone ${master} ${dest}
}

function install_yum {
	sudo yum install -y ctags ack grep git tig
}

function install_pip {
    pip
    if [ $? -eq 0 ]; then
        echo "pip had installed!"
    else
	    curl -O "https://raw.github.com/pypa/pip/master/contrib/get-pip.py"
	    sudo python get-pip.py
    fi
	sudo pip install pylint
	sudo pip install virtualenvwrapper
	sudo pip install coverage
    sudo pip install isort
}

function install_zsh {

	ln -fs ${dest}/zshrc ~/.zshrc
}

function install_vim {
    

	ln -fs ${dest}/vimrc ~/.vimrc
	rm -rf ~/.vim/bundle/vundle
	git clone -q ${vundle} ~/.vim/bundle/vundle
	vim +NeoBundleInstall +qall
	mkdir -p ~/.vim/undo
}    
function install_all {
     
    install_yum
    install_vim
    install_pip
    install_zsh

}
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"
    if [ -L "${target}" ]; then
        unlink $target
    fi

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
    fi

    ln -sf ${source} ${target}
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink ${target}
        mv $target.df.bak $target
    fi
}


function link {

if [ "$1" = "restore" ]; then
    for i in _*
    do
        unlink_file $i
    done
    exit
else
    for i in _*
    do
        link_file $i
    done
fi
}

download

install_$1
