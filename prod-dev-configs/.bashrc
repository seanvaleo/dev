
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set longer history length
HISTSIZE=10000
HISTFILESIZE=20000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to current directory only
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND="echo -ne \"\033]0;${PWD/${PWD%*\/*}\/}\007\""
    ;;
*)
    ;;
esac

# Color Support 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias reload config
alias reload='source ~/.bashrc'

# Alias 'v' for 'vim'
alias v='vim'

# Alias 'f' to find a string in current path
alias f='grep -Rin'

# Alias 'h' to find a string in history
alias h='history | grep'

# Alias 'l' for 'ls -la' with nice output
alias l='ls --color -h --group-directories-first -la'

# On every 'cd' do an 'l'
cd(){ command cd "$1" && l; }

# Alias 'cd' to popular directories
alias vms='cd /home/sean/Desktop/prod-dev-vagrantfiles/'
alias logstream='cd /home/sean/Desktop/prod-dev-src/external/cribl/cribl/'
alias appscope='cd /home/sean/Desktop/prod-dev-src/external/criblio/appscope/'

# Alias edit popular files with 'vim'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'

# Alias docker commands
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dps='docker ps'
alias docker-nuke='docker rm -vf $(docker ps -a -q) && docker rmi -f $(docker images -a -q)'

# Alias scope directory
alias scope='bin/linux/x86_64/scope'

# Make Go work
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/$USER/go

# Increase nodejs memory usage to 8gb
export NODE_OPTIONS="--max-old-space-size=8192" #increase to 8gb

# Define cribl cloud destination
export CLOUD=tcp://in.logstream.brave-archimedes.cribl.cloud:10091



