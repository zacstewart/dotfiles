setup_prompt() {
  readonly PS_SYMBOL='$'
  readonly GIT_NEED_PUSH_SYMBOL='⇡'
  readonly GIT_NEED_PULL_SYMBOL='⇣'

  FG_BLUE="\[$(tput setaf 4)\]"
  FG_CYAN="\[$(tput setaf 6)\]"
  FG_GREEN="\[$(tput setaf 2)\]"
  FG_MAGENTA="\[$(tput setaf 5)\]"
  FG_ORANGE="\[$(tput setaf 9)\]"
  FG_RED="\[$(tput setaf 1)\]"
  FG_VIOLET="\[$(tput setaf 13)\]"
  FG_YELLOW="\[$(tput setaf 3)\]"
  FG_WHITE="\[$(tput setaf 7)\]"

  BG_BLUE="\[$(tput setab 4)\]"
  BG_CYAN="\[$(tput setab 6)\]"
  BG_GREEN="\[$(tput setab 2)\]"
  BG_MAGENTA="\[$(tput setab 5)\]"
  BG_ORANGE="\[$(tput setab 9)\]"
  BG_RED="\[$(tput setab 1)\]"
  BG_VIOLET="\[$(tput setab 13)\]"
  BG_YELLOW="\[$(tput setab 3)\]"
  BG_WHITE="\[$(tput setab 7)\]"

  DIM="\[$(tput dim)\]"
  REVERSE="\[$(tput rev)\]"
  RESET="\[$(tput sgr0)\]"
  BOLD="\[$(tput bold)\]"

  __git_status() {
    local git='env LANG=c git'
    local ref="$($git symbolic-ref --short HEAD 2>/dev/null || $git describe --tags --always 2> /dev/null)"
    [ -n "$ref" ] || return

    local changes
    local status="$($git status --porcelain --branch 2>/dev/null | grep '^##' | grep -o '\[.\+\]$')"
    local n_ahead="$(echo $status | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local n_behind="$(echo $status | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    [ -n "$n_ahead" ] && changes+=" $GIT_NEED_PUSH_SYMBOL$n_ahead"
    [ -n "$n_behind" ] && changes+=" $GIT_NEED_PULL_SYMBOL$n_behind"
    printf " [$FG_YELLOW$ref$changes$RESET]"
  }

  ps1() {
    case $? in
      0)
        local fg_exit="$FG_GREEN"
        ;;
      1)
        local fg_exit="$FG_RED"
        ;;
      *)
        local fg_exit="$FG_YELLO"
    esac

    PS1="\w$(__git_status) $fg_exit$PS_SYMBOL$RESET "
  }

  PROMPT_COMMAND=ps1
}

setup_prompt
unset setup_prompt
