# Prompt
WHITE_ON_GREEN="\[\033[37;42m\]"
RED="\[\033[31;1m\]"
RESET="\[\033[00m\]"
GRAY="\[\033[01;32m\]"
DOLLAR_OR_POUND="\$"
BASEDIR="\W"

export PS1="$WHITE_ON_GREEN $BASEDIR$WHITE_ON_GREEN $DOLLAR_OR_POUND $RESET "

# Go
export GOPATH=$HOME/Projects
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin
