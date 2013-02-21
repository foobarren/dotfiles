master=git://github.com/luin/dotfiles.git
vundle=git://github.com/gmarik/vundle.git
dest=~/.luin_dotfiles_tmp

NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
OK_STR=" $(OK_COLOR)[OK]$(NO_COLOR)"

ECHON=/bin/echo -n

all: install
install: download install-zsh install-vim
	@rm -rf $(dest)

download:
	@rm -rf $(dest)
	git clone --recursive -q $(master) $(dest)

install-zsh:
	ln -fs $(dest)/zshrc ~/.zshrc

install-vim:
	ln -fs $(dest)/vimrc ~/.vimrc
	@rm -rf ~/.vim/bundle/vundle
	git clone -q $(vundle) ~/.vim/bundle/vundle
	@vim +BundleInstall +qall
	@mkdir -p ~/.vim/undo
	@cp -r $(dest)/snipmate-snippets/snippets ~/.vim/bundle/snipmate-snippets


clean: clean-zsh clean-vim

clean-zsh:
	@$(ECHON) Backing up ~/.zshrc to ~/.zshrc.old ...
	@cp ~/.zshrc{,.old}
	@echo $(OK_STR)
	@$(ECHON) "Removing ~/.zshrc ..."
	@rm -f ./.zshrc
	@echo $(OK_STR)

clean-vim:
	@$(ECHON) "Backing up ~/.vim to ~/.vim.old ..."
	@cp -r ~/.vim{,.old}
	@echo $(OK_STR)
	@$(ECHON) "Removing ~/.vim ..."
	@rm -rf ~/.vim
	@echo $(OK_STR)
	@$(ECHON) "Backing up ~/.vimrc to ~/.vimrc.old ..."
	@cp ~/.vimrc{,.old}
	@echo $(OK_STR)
	@$(ECHON) "Removing ~/.vimrc ..."
	@rm -f ~/.vimrc
	@echo $(OK_STR)
