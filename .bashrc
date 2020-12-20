# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [[ $( tty ) == /dev/tty? ]]; then
    setleds +num
fi

numlockx on

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# new comment begins #

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# new comment ends #

# some more ls aliases
alias ll='ls -alFSh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export VISUAL=vim
export EDITOR="$VISUAL"
export ANDROID_HOME=/opt/android-sdk
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dl='cd ~/Downloads'
# 
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# PS1 CONFIG {{{
[[ -f $HOME/.dircolors ]] && eval $(dircolors -b $HOME/.dircolors)
if $_isxrunning; then

  [[ -f $HOME/.dircolors_256 ]] && eval $(dircolors -b $HOME/.dircolors_256)

  export TERM='xterm-256color'

  B='\[\e[1;38;5;33m\]'
  LB='\[\e[1;38;5;81m\]'
  GY='\[\e[1;38;5;242m\]'
  G='\[\e[1;38;5;82m\]'
  P='\[\e[1;38;5;161m\]'
  PP='\[\e[1;38;5;93m\]'
  R='\[\e[1;38;5;196m\]'
  Y='\[\e[1;38;5;214m\]'
  W='\[\e[0m\]'

  get_prompt_symbol() {
    [[ $UID == 0 ]] && echo "#" || echo "\$"
  }

  if [[ $PS1 && -f /usr/share/git/git-prompt.sh ]]; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/git-prompt.sh

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=0

    export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W\$(__git_ps1 \"$GY|$LB%s\")$GY]$W\$(get_prompt_symbol) "
  else
    export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W$GY]$W\$(get_prompt_symbol) "
  fi
else
  export TERM='xterm-color'
fi
#}}}



# COLORED MANUAL PAGES {{{
# @see http://www.tuxarena.com/?p=508
# For colourful man pages (CLUG-Wiki style)
if $_isxrunning; then
  export PAGER=less
  export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\E[0m'           # end mode
  export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\E[0m'           # end underline
  export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi
#}}}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#alias gcc='gcc-5 -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Weffc++'
alias flux='xflux -l 38 -g 42'
alias stop_docker='docker stop $(docker ps -a -q)'
eval `ssh-agent -s` &>/dev/null
ssh-add ~/.ssh/id_rsa &>/dev/null


darker() {
    redshift -P -O $1
}

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/default
export BROWSER=/usr/bin/firefox
alias run_android='emulator -avd Pixel_2_API_28 & disown'
source ~/.bash_profile

alias picom2="picom --experimental-backends &"
alias picom="(picom2) && disown"
alias ntp="sudo ntpdate -s time.nist.gov"
alias redshift="redshift -P -O 3000"


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
for al in $(git config --get-regexp '^alias\.' | cut -f 1 -d ' ' | cut -f 2 -d '.'); do

  alias g${al}="git ${al}"

  complete_func=_git_$(__git_aliased_command ${al})
  function_exists ${complete_fnc} && __git_complete g${al} ${complete_func}
done
unset al
