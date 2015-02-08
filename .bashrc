# Check for an interactive session
[ -z "$PS1" ] && return

PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[01;34m\]$\[\033[00m\] '

# HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# ALIAS
# ls
alias ls='ls --color=auto'
# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# pacman
alias pacman='yaourt'
#emacs
alias emacs='emacsclient -c '

# AUTOCOMPLETION (bash-comletion)
# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f /usr/share/git/completion/git-completion.bash ]; then # Archlinux
  . /usr/share/git/completion/git-completion.bash
  . /usr/share/git/completion/git-prompt.sh
fi

complete -cf sudo
complete -cf man

# EXPORTS
export EDITOR='emacs'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# PATH
RUBY_GEMS=~/.gem/ruby/2.1.0/bin
if [ -d "$RUBY_GEMS" ]; then
  PATH=$PATH:$RUBY_GEMS
fi

# GOLANG
GOROOT=$HOME/opt/go
if [ -d "$GOROOT" ]; then
    export PATH=$PATH:$GOROOT/bin
    export GOPATH=$HOME/src/go
fi

# Use bash_local if it exists
if [ -f ~/.bash_local ]; then
. ~/.bash_local
fi
