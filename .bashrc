# Check for an interactive session
[ -z "$PS1" ] && return

PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[01;34m\]$\[\033[00m\] '

# EXPORTS
export EDITOR='emacs'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

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
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# pacman
alias pacman='pacaur'

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
