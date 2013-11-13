# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew cake gem npm osx redis-cli rails3 git-extras git-flow zsh-syntax-highlighting)

# ZSH-SYNTAX-HIGHLIGHTING
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -[rf]*' 'fg=white,bold,bg=red')

source $ZSH/oh-my-zsh.sh

export PATH=/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:$HOME/.rvm/bin:/usr/local/share/npm/bin:/Applications/MNPP/init
export PATH=$PATH:/Users/luin/.rvm/gems/ruby-1.9.3-p194/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

source ~/.nvm/nvm.sh

# Shortcuts
alias psgrep="ps aux | grep -v grep | grep"
alias l="ls -alh"
alias v="vim"
mkcd() { mkdir -p "$@" && cd "$_"; }

# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias iip="ipconfig getifaddr en1"

# Tmuxinator
export DISABLE_AUTO_TITLE=true
source ~/.bin/tmuxinator.zsh
alias m="mux start"

# Language
export LANG="zh_CN.UTF-8"
export LC_COLLATE="zh_CN.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
export LC_MESSAGES="zh_CN.UTF-8"
export LC_MONETARY="zh_CN.UTF-8"
export LC_NUMERIC="zh_CN.UTF-8"
export LC_TIME="zh_CN.UTF-8"
export LC_ALL=

export EDITOR='vim'

export PATH=/Applications/MNPP/init:/Applications/MNPP/Library/php54/bin:/Applications/MNPP/Library/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/Applications/MNPP/init:/Applications/MNPP/Library/lib:/Applications/MNPP/init:/Applications/MNPP/Library/lib:

alias fpm='sudo /Applications/MNPP/init/php.sh 54 start'
export PATH=/usr/local/sbin:/Applications/MNPP/init:/Applications/MNPP/Library/php54/bin:/Applications/MNPP/Library/mysql/bin:/Users/Luin/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Luin/.rvm/bin:/Users/Luin/.rvm/bin:/Users/luin/.rvm/bin:/usr/local/opt/ruby/bin
alias node='node --harmony-generators'
