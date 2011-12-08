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


