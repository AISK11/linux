## AUTHOR:       AISK11
## LOCATION:     ~/.zshrc (0644)
## DEPENDENCIES: zsh [zsh-autosuggestions] [zsh-syntax-highlighting]
## DESCRIPTION:  Zsh config file.

## ZSH INVOCATION.
##        +-----------------+  +--------------------+
## START->| /etc/zsh/zshenv |->| ${ZDOTDIR}/.zshenv |
##        +-----------------+  +--------------------+
##                                                  |
## +------------------------------------------------+
## |
## |             +-------------------+  +----------------------+
## LOGIN SHELL?->| /etc/zsh/zprofile |->| ${ZDOTDIR}/.zprofile |
## |             +-------------------+  +----------------------+
## |                                                           |
## +-----------------------------------------------------------+
## |
## |                   +----------------+  +-------------------+
## INTERACTIVE SHELL?->| /etc/zsh/zshrc |->| ${ZDOTDIR}/.zshrc |
## |                   +----------------+  +-------------------+
## |                                                           |
## +-----------------------------------------------------------+
## |
## |             +-----------------+  +--------------------+
## LOGIN SHELL?->| /etc/zsh/zlogin |->| ${ZDOTDIR}/.zlogin |
## |             +-----------------+  +--------------------+
## |                                                       |
## +-------------------------------------------------------+
## |
## EXIT CALL
## |
## |             +---------------------+  +------------------+
## LOGIN SHELL?->| ${ZDOTDIR}/.zlogout |->| /etc/zsh/zlogout |
## |             +---------------------+  +------------------+
## |                                                         |
## +---------------------------------------------------------+
## |
## END

################################################################################
##                               SHELL OPTIONS                                ##
################################################################################
## Changing directories.
setopt   AUTO_CD
unsetopt CDABLE_VARS

## Completion.
unsetopt AUTO_LIST
unsetopt AUTO_PARAM_KEYS
unsetopt MENU_COMPLETE

## History.
setopt   HIST_EXPIRE_DUPS_FIRST
setopt   HIST_FCNTL_LOCK
setopt   HIST_FIND_NO_DUPS
setopt   HIST_IGNORE_ALL_DUPS
setopt   HIST_IGNORE_SPACE
setopt   HIST_REDUCE_BLANKS
setopt   HIST_SAVE_NO_DUPS
setopt   HIST_VERIFY
setopt   SHARE_HISTORY

## Input/Output.
unsetopt HASH_CMDS
setopt   INTERACTIVE_COMMENTS

## Shell emulation.
setopt   BSD_ECHO

## Zle.
unsetopt BEEP
setopt   VI
setopt   NO_NOMATCH

################################################################################
##                                    KEYS                                    ##
################################################################################
## Create a zkbd compatible hash.
typeset -g -A key
key[Backspace]="${terminfo[kbs]}"
key[Insert]="${terminfo[kich1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Delete]="${terminfo[kdch1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"

## Setup keys.
[ -n "${key[Backspace]}" ] && bindkey -- "${key[Backspace]}" backward-delete-char
[ -n "${key[Insert]}"    ] && bindkey -- "${key[Insert]}"    overwrite-mode
[ -n "${key[Up]}"        ] && bindkey -- "${key[Up]}"        up-line-or-history
[ -n "${key[Down]}"      ] && bindkey -- "${key[Down]}"      down-line-or-history
[ -n "${key[Left]}"      ] && bindkey -- "${key[Left]}"      backward-char
[ -n "${key[Right]}"     ] && bindkey -- "${key[Right]}"     forward-char
[ -n "${key[Home]}"      ] && bindkey -- "${key[Home]}"      beginning-of-line
[ -n "${key[End]}"       ] && bindkey -- "${key[End]}"       end-of-line
[ -n "${key[Delete]}"    ] && bindkey -- "${key[Delete]}"    delete-char
[ -n "${key[Shift-Tab]}" ] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
[ -n "${key[PageUp]}"    ] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[ -n "${key[PageDown]}"  ] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history

## Setup keys (vi mode).
[ -n "${key[Backspace]}" ] && bindkey -M vicmd "${key[Backspace]}" backward-delete-char
[ -n "${key[Insert]}"    ] && bindkey -M vicmd "${key[Insert]}"    overwrite-mode
[ -n "${key[Up]}"        ] && bindkey -M vicmd "${key[Up]}"        up-line-or-history
[ -n "${key[Down]}"      ] && bindkey -M vicmd "${key[Down]}"      down-line-or-history
[ -n "${key[Left]}"      ] && bindkey -M vicmd "${key[Left]}"      backward-char
[ -n "${key[Right]}"     ] && bindkey -M vicmd "${key[Right]}"     forward-char
[ -n "${key[Home]}"      ] && bindkey -M vicmd "${key[Home]}"      beginning-of-line
[ -n "${key[End]}"       ] && bindkey -M vicmd "${key[End]}"       end-of-line
[ -n "${key[Delete]}"    ] && bindkey -M vicmd "${key[Delete]}"    delete-char
[ -n "${key[Shift-Tab]}" ] && bindkey -M vicmd "${key[Shift-Tab]}" reverse-menu-complete
[ -n "${key[PageUp]}"    ] && bindkey -M vicmd "${key[PageUp]}"    beginning-of-buffer-or-history
[ -n "${key[PageDown]}"  ] && bindkey -M vicmd "${key[PageDown]}"  end-of-buffer-or-history

## Make sure that terminal is in application mode, when zle is active,
## otherwise $terminfo values are invalid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop  { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init   zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

################################################################################
##                                 VARIABLES                                  ##
################################################################################
########################################
##          SHELL VARIABLES           ##
########################################
## Default search path for executables.
export PATH=''
[ ! -L "/sbin" ]            && PATH="${PATH}:/sbin"
[ ! -L "/bin" ]             && PATH="${PATH}:/bin"
[ ! -L "/usr/sbin" ]        && PATH="${PATH}:/usr/sbin"
[ ! -L "/usr/bin" ]         && PATH="${PATH}:/usr/bin"
[ ! -L "/usr/local/sbin" ]  && PATH="${PATH}:/usr/local/sbin"
[ ! -L "/usr/local/bin" ]   && PATH="${PATH}:/usr/local/bin"
[ -d "${HOME}/.local/bin" ] && PATH="${PATH}:${HOME}/.local/bin"
[ -d "${HOME}/bin" ]        && PATH="${PATH}:${HOME}/bin"
PATH="${PATH#:}"

## History.
export HISTSIZE='2000'
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"

## Command prompts (colors: black, red, green, yellow, blue, magenta, cyan, white)..
export PROMPT_EOL_MARK='%B%S%#%s%b'
export PS1='%B%(!.%F{red}.%F{green})%n%F{yellow}@%(!.%F{red}.%F{green})%m %F{blue}%~ %(?.%F{green}.%F{red})%(!.#.$) %f%b'
export PS2='> '
export PS4='+ '

## Keyboard.
export KEYTIMEOUT='40'

## Locale.
export LANG='C.UTF-8'

########################################
##          DEFAULT PROGRAMS          ##
########################################
## Manpager.
if [ "$(command -vp less)" ]; then
    export PAGER='less'
else
    export PAGER=''
fi
export MANPAGER="${PAGER}"

## Text editor.
if [ "$(command -vp nvim)" ]; then
    export VISUAL='nvim'
elif [ "$(command -vp vim)" ]; then
    export VISUAL='vim'
elif [ "$(command -vp vi)" ]; then
    export VISUAL='vi'
else
    export VISUAL=''
fi
export EDITOR="${VISUAL}"

########################################
##         PROGRAM VARIABLES          ##
########################################
## "$(less)".
export LESS='-R --use-color -Ddr$Dub$DSky$DPkb$ -i --follow-name --file-size -Ps[File\: "?f%f:STDIN." | Lines\: %lt-%lb/%L (?e100:%Pb.\%)]$'
export LESSHISTFILE='/dev/null'
export LESSHISTSIZE='0'

## "$(man)".
export MANLESS='[Manual\: \$MAN_PN\] | Lines\: %lt-%lb/%L (?e100:%Pb.\%)]$'

## Color mode.
#export COLOR_MODE='always'
export COLOR_MODE='auto'
