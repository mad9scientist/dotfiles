# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%Y-%m-%d %T "

## Append to History
shopt -s histappend

## History Lenght
HISTSIZE=2500
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Git Info for PS1
export GIT_PS1_SHOWDIRTYSTATE=
source ~/.git-prompt.sh

function changes_in_branch() {
	if [ -d .git ]; then
		if expr length + "$(git status)" 2>&1 > /dev/null; then
			echo -ne "\033[0;33m$(__git_ps1)\033[0m";
		else
			echo -ne "\033[0;32m$(__git_ps1)\033[0m"; fi
	fi
}

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1="┌──[\[\e[36m\]\t\[\e[m\]][\[\e[31m\]\u\[\e[m\]@\[\e[36m\]\H\[\e[m\]]: \e[1;33m\]\w\[\e[m\] \[\033[01;32m\]$(__git_ps1)\[\033[01;00m\] \n└──\[\e[5;31m\]\\$\[\e[m "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
   PS1="┌──[\[\e[36m\]\t\[\e[m\]][\[\e[31m\]\u\[\e[m\]@\[\e[36m\]\H\[\e[m\]]: \e[1;33m\]\w\[\e[m\] \[\033[01;32m\]"
   PS1+=$(changes_in_branch)
   PS1+="\[\033[01;00m\] \n└──\[\e[5;31m\]\\$\[\e[m "
   export PS1
    ;;
*)
    ;;
esac

function prompt_builder() {
	PS1="┌──[\[\e[36m\]\t\[\e[m\]][\[\e[31m\]\u\[\e[m\]@\[\e[36m\]\H\[\e[m\]]: \e[1;33m\]\w\[\e[m\] \[\033[01;32m\]"
	PS1+=$(__git_ps1 "(%s)")
	PS1+="\[\033[01;00m\] \n└──\[\e[5;31m\]\\$\[\e[m "
	export PS1
}
PROMPT_COMMAND=prompt_builder


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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias import
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Editor
export EDITOR=vim

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
