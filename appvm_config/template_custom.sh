# ---------------------------------------------------------------------
# STANDARD APPLICATIONS
# ---------------------------------------------------------------------

export EDITOR="vi"
export BROWSER="qvm-open-in-dvm"

# ---------------------------------------------------------------------
# PATH EXPANSION
# ---------------------------------------------------------------------

export PATH="~/.local/bin/:$PATH"

# add the scripts directory and every subdirectory recursively
SCRIPTS="~/Scripts"
if [[ -d "$SCRIPTS" ]]
then
    PATH=${PATH}:$(find $SCRIPTS -type d | tr '\n' ':' | sed 's/:$//')
fi

# ---------------------------------------------------------------------
# HISTORY
# ---------------------------------------------------------------------

# if the command was previously already recorded it is ignored
export HISTCONTROL=ignoredups

# increases the command line history size from 500 lines to 1000 lines
export HISTSIZE=1000

# ---------------------------------------------------------------------
# ALIASES
# ---------------------------------------------------------------------

alias la="ls -A"
alias l="ls -CF"
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'

alias ga="git add -A"
alias gs="git status"
alias gcm="git commit -m"
alias gp="git push"
alias gu="git pull"
alias gl="git log"

# useful shortcuts for the arduino-cli command line tool
alias arduino-compile="/snap/arduino-cli/31/usr/bin/arduino-cli compile -b arduino:avr:uno ."
alias arduino-upload="/snap/arduino-cli/31/usr/bin/arduino-cli upload -p /dev/ttyACM0 -b arduino:avr:uno"
alias arduino-install="/snap/arduino-cli/31/usr/bin/arduino-cli lib install "
alias arduino-monitor="putty /dev/ttyACM0 -serial -sercfg 9600,8,n,1,N &"

# --------------------------------------------------------------------
# FUNCTIONS
# --------------------------------------------------------------------

# this function uses df to determine the amount of used disk space
ds () {
    echo "Disk Space Utilization for $HOSTNAME"
    df -h
}

# --------------------------------------------------------------------
# STARTUP COMMANDS
# --------------------------------------------------------------------

# login greetings in form of the current date at session start
date +"%A - %d %B %Y - %r" # Monday - 04 October 2021 - 10:02:17 PM

