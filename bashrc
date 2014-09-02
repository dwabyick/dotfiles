#!/bin/bash
#
# Daniel Wabyick

# -------------------------------------------------------------
# Basics
# -------------------------------------------------------------

# custom path
if [ -f ~/.bash_path ]; then
  . ~/.bash_path
fi

# -------------------------------------------------------------
# External Includes
# -------------------------------------------------------------

# custom (non ls-related) aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# -------------------------------------------------------------
# Git completion
# -------------------------------------------------------------

# custom (non ls-related) aliases
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# -------------------------------------------------------------
# Prompt
# -------------------------------------------------------------

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;34m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"

if [ "$LOGNAME" = "root" ]; then
  COLOR1="${RED}"
  COLOR2="${BROWN}"
  P="#"
else
  COLOR1="${BLUE}"
  COLOR2="${BROWN}"
  P="\$"
fi

prompt_bw() {
  PS1="\w${P} "
  PS2="> "
}

prompt_color() {
  PS1="${COLOR2}\w${COLOR1}${P}${PS_CLEAR} "
  PS2="${COLOR1}>${PS_CLEAR} "
}

export CLICOLORS=1
prompt_bw


# -------------------------------------------------------------
# ls and Colors
# ------------------------------------------------------------- 

dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
  COLORS=/etc/DIR_COLORS
  test -e "/etc/DIR_COLORS.$TERM" && COLORS="/etc/DIR_COLORS.$TERM"
  test -e "$HOME/.dircolors" && COLORS="$HOME/.dircolors"
  test ! -e "$COLORS"
  eval `$dircolors --sh $COLORS`
}
unset dircolors

LS_COMMON="-hBG"
test -n "$LS_COMMON" &&
alias ls="command ls $LS_COMMON"

# -------------------------------------------------------------
# Git Prompt
# ------------------------------------------------------------- 
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            # background to green
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            # background to yellow
            local ansi=43
        else
            # background to red
            local ansi=41
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        # ansi 30 = foreground to black
        echo -n '\[\e[0;30;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    PS1="`_git_prompt`\W\$ "
}
PROMPT_COMMAND=_prompt_command

# -------------------------------------------------------------
# misc
# -------------------------------------------------------------

ulimit -S -n 2048

