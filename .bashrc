# Check for an interactive session
[ -z "$PS1" ] && return

#PS1='\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[01;34m\]$\[\033[00m\] '

PS1='\e[32m\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[01;34m\]$\[\033[00m\] '


# HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# Use bash_local if it exists
if [ -f ~/.bash_local ]; then
. ~/.bash_local
fi

if [ -f ~/.aliases ]; then
. ~/.aliases
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/basoko/.sdkman"
[[ -s "/home/basoko/.sdkman/bin/sdkman-init.sh" ]] && source "/home/basoko/.sdkman/bin/sdkman-init.sh"

# added by travis gem
[ -f /home/basoko/.travis/travis.sh ] && source /home/basoko/.travis/travis.sh
