## AUTHOR:       AISK11
## LOCATION:     ~/.zshrc (0644)
## DEPENDENCIES: zsh [zsh-autosuggestions] [zsh-syntax-highlighting]
## DESCRIPTION:  Interactive zsh config file.

################################################################################
##                                 INVOCATION                                 ##
################################################################################
##        +-----------------+  +--------------------+
## START->| /etc/zsh/zshenv |->| ${ZDOTDIR}/.zshenv |
##        +-----------------+  +--------------------+
##                                                  |
## +------------------------------------------------+
## |
## |                +-------------------+  +----------------------+
## LOGIN SHELL? Y ->| /etc/zsh/zprofile |->| ${ZDOTDIR}/.zprofile |
## N                +-------------------+  +----------------------+
## |                                                              |
## +--------------------------------------------------------------+
## |
## |                      +----------------+  +-------------------+
## INTERACTIVE SHELL? Y ->| /etc/zsh/zshrc |->| ${ZDOTDIR}/.zshrc |
## N                      +----------------+  +-------------------+
## |                                                              |
## +--------------------------------------------------------------+
## |
## |                +-----------------+  +--------------------+
## LOGIN SHELL? Y ->| /etc/zsh/zlogin |->| ${ZDOTDIR}/.zlogin |
## N                +-----------------+  +--------------------+
## |                                                          |
## +----------------------------------------------------------+
## |
## EXIT CALL
## |
## |                +---------------------+  +------------------+
## LOGIN SHELL? Y ->| ${ZDOTDIR}/.zlogout |->| /etc/zsh/zlogout |
## N                +---------------------+  +------------------+
## |                                                            |
## +------------------------------------------------------------+
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
#typeset -g -A key
#key[Backspace]="${terminfo[kbs]}"
#key[Insert]="${terminfo[kich1]}"
#key[Up]="${terminfo[kcuu1]}"
#key[Down]="${terminfo[kcud1]}"
#key[Left]="${terminfo[kcub1]}"
#key[Right]="${terminfo[kcuf1]}"
#key[Home]="${terminfo[khome]}"
#key[End]="${terminfo[kend]}"
#key[Delete]="${terminfo[kdch1]}"
#key[Shift-Tab]="${terminfo[kcbt]}"
#key[PageUp]="${terminfo[kpp]}"
#key[PageDown]="${terminfo[knp]}"

## Setup keys.
#[ -n "${key[Backspace]}" ] && bindkey -- "${key[Backspace]}" backward-delete-char
#[ -n "${key[Insert]}"    ] && bindkey -- "${key[Insert]}"    overwrite-mode
#[ -n "${key[Up]}"        ] && bindkey -- "${key[Up]}"        up-line-or-history
#[ -n "${key[Down]}"      ] && bindkey -- "${key[Down]}"      down-line-or-history
#[ -n "${key[Left]}"      ] && bindkey -- "${key[Left]}"      backward-char
#[ -n "${key[Right]}"     ] && bindkey -- "${key[Right]}"     forward-char
#[ -n "${key[Home]}"      ] && bindkey -- "${key[Home]}"      beginning-of-line
#[ -n "${key[End]}"       ] && bindkey -- "${key[End]}"       end-of-line
#[ -n "${key[Delete]}"    ] && bindkey -- "${key[Delete]}"    delete-char
#[ -n "${key[Shift-Tab]}" ] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
#[ -n "${key[PageUp]}"    ] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
#[ -n "${key[PageDown]}"  ] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history

## Setup keys (vi mode).
#[ -n "${key[Backspace]}" ] && bindkey -M vicmd "${key[Backspace]}" backward-delete-char
#[ -n "${key[Insert]}"    ] && bindkey -M vicmd "${key[Insert]}"    overwrite-mode
#[ -n "${key[Up]}"        ] && bindkey -M vicmd "${key[Up]}"        up-line-or-history
#[ -n "${key[Down]}"      ] && bindkey -M vicmd "${key[Down]}"      down-line-or-history
#[ -n "${key[Left]}"      ] && bindkey -M vicmd "${key[Left]}"      backward-char
#[ -n "${key[Right]}"     ] && bindkey -M vicmd "${key[Right]}"     forward-char
#[ -n "${key[Home]}"      ] && bindkey -M vicmd "${key[Home]}"      beginning-of-line
#[ -n "${key[End]}"       ] && bindkey -M vicmd "${key[End]}"       end-of-line
#[ -n "${key[Delete]}"    ] && bindkey -M vicmd "${key[Delete]}"    delete-char
#[ -n "${key[Shift-Tab]}" ] && bindkey -M vicmd "${key[Shift-Tab]}" reverse-menu-complete
#[ -n "${key[PageUp]}"    ] && bindkey -M vicmd "${key[PageUp]}"    beginning-of-buffer-or-history
#[ -n "${key[PageDown]}"  ] && bindkey -M vicmd "${key[PageDown]}"  end-of-buffer-or-history

## Make sure that terminal is in application mode, when zle is active,
## otherwise $terminfo values are invalid.
#if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
#    autoload -Uz add-zle-hook-widget
#    function zle_application_mode_start { echoti smkx; }
#    function zle_application_mode_stop  { echoti rmkx; }
#    add-zle-hook-widget -Uz zle-line-init   zle_application_mode_start
#    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
#fi

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
export HISTSIZE='5000'
export SAVEHIST="${HISTSIZE}"
export HISTFILE="${HOME}/.zsh_history"

## Command prompts.
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
## Color mode.
#export COLOR_MODE='always'
export COLOR_MODE='auto'

## Text editor.
if [ -n "$(command -vp nvim)" ]; then
    export VISUAL='nvim'
elif [ -n "$(command -vp vim)" ]; then
    export VISUAL='vim'
elif [ -n "$(command -vp vi)" ]; then
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
if [ -n "$(command -vp less)" ]; then
    export PAGER='less'
else
    export PAGER=''
fi
export MANPAGER="${PAGER}"
export MANLESS='[Manual\: \$MAN_PN\] | Lines\: %lt-%lb/%L (?e100:%Pb.\%)]$'

################################################################################
##                                  ALIASES                                   ##
################################################################################
########################################
##               SET UP               ##
########################################
## Unalias all previous aliases.
unalias -a

########################################
##              COMMANDS              ##
########################################
## Kernel.
alias dmesg='\dmesg --color=${COLOR_MODE}'

## System.
alias history='\history 0'
alias date='\date "+%Y-%m-%d %H:%M:%S %Z"'
alias pstree='\pstree -C age -h'
alias kill='\kill -9'
alias killall='\killall -9'

## Filesystem.
alias mkdir='\mkdir -p'
alias ls='\ls --color=${COLOR_MODE} -F --group-directories-first'
alias tree='\tree -C'
alias file='\file -p'

## Text reading.
alias grep='\grep --color=${COLOR_MODE}'
alias egrep='\grep -E --color=${COLOR_MODE}'
alias diff='\diff --color=${COLOR_MODE} -s'
alias nl='\nl -s " "'

## Multimedia.
alias mpv='\mpv --audio-display=no'
alias yt-dlp='\yt-dlp -ix --progress -f bestaudio --audio-quality 0 --audio-format mp3 -o "%(title)s.%(ext)s"'
alias mp3gain='\mp3gain -r -k'

## Network.
alias ip='\ip --color=${COLOR_MODE}'
alias mtr='\mtr -t'
alias nmap='\nmap -T4'

########################################
##            ALTERNATIVES            ##
########################################
## Filesystem.
if [ -n "$(command -vp lsd)" ]; then
    alias ls='\lsd --color=${COLOR_MODE} -F --group-dirs first --icon never'
fi

## Text reading.
if [ -z "$(command -vp xxd)" ]; then
    alias xxd='\hexdump -C'
fi

## Text editing.
if [ -n "$(command -vp nvim)" ]; then
    alias vim='\nvim'
    alias vi='\nvim'
elif [ -n "$(command -vp vim)" ]; then
    alias nvim='\vim'
    alias vi='\vim'
elif [ -n "$(command -vp vi)" ]; then
    alias nvim='\vi'
    alias vim='\vi'
fi

## Security.
if [ -n "$(command -vp doas)" ]; then
    alias sudo='\doas'
elif [ -n "$(command -vp sudo)" ]; then
    alias doas='\sudo'
fi

########################################
##               CUSTOM               ##
########################################
## System.
alias idate='\date "+%Y-%m-%dT%H:%M:%S%z"'
alias pname='\ps -o cmd -h -p'

## Filesystem.
alias cpf='\cp -rTd --'
alias path='\realpath -s'
alias linkpath='\readlink -f'

## Gaming.
alias nvrun='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'

################################################################################
##                                 FUNCTIONS                                  ##
################################################################################
## Filesystem.
getshell() {
    SHELLFILE="$(\ps -o cmd -h -p ${$} | \cut -d " " -f 1)"
    [ "${SHELLFILE#-}" != "${SHELLFILE}" ] && ISLOGIN='-' || ISLOGIN=''
    \echo "${ISLOGIN}$(\basename $(\readlink -f "${SHELLFILE#-}"))"
}








## ToDo

## ^C not shown
## alias expansion
## cod implementation

################################################################################
##                                  MODULES                                   ##
################################################################################
########################################
##     COMMAND NOT FOUND HANDLER      ##
########################################
## ANSI escape code colors.
## For details see: https://en.wikipedia.org/wiki/ANSI_escape_code
export ANSI_BLACK="\e[30m"
export ANSI_RED="\e[31m"
export ANSI_GREEN="\e[32m"
export ANSI_YELLOW="\e[33m"
export ANSI_BLUE="\e[34m"
export ANSI_MAGENTA="\e[35m"
export ANSI_CYAN="\e[36m"
export ANSI_WHITE="\e[37m"
export ANSI_RESET="\e[0m"

## How to handle, when command does not exists.
#if [ -r '/etc/zsh_command_not_found' ]; then
#    . /etc/zsh_command_not_found
#else
    command_not_found_handler () {
        echo -e "${ANSI_RED}Command '${0}' not found!${ANSI_RESET}"
        return 127
    }
#fi

########################################
##          AUTO COMPLETION           ##
########################################
## Load autocompletion.
autoload -Uz compinit

## Menu selection.
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

########################################
##         HISTORY COMPLETION         ##
########################################
## Show history commands to match completion in ZLE.
[ -f '/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh' ] &&
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## Set autosuggestion color (0-7 || 0-F) (for TTY it's white).
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${THEME_COLOR_CLI_8}"

########################################
##        SYNTAX HIGHLIGHTING         ##
########################################
## Enable syntax highlighting.
## Docs: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
[ -f '/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ] &&
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################
##                                  EXECUTE                                   ##
################################################################################
########################################
##            TTY SPECIFIC            ##
########################################
if [ "${TERM}" = "linux" ]; then
    ####################
    ##     COLORS     ##
    ####################
    echo -en "\033]P0${THEME_COLOR_CLI_0}" ## Black
    echo -en "\033]P1${THEME_COLOR_CLI_1}" ## Red
    echo -en "\033]P2${THEME_COLOR_CLI_2}" ## Green
    echo -en "\033]P3${THEME_COLOR_CLI_3}" ## Yellow
    echo -en "\033]P4${THEME_COLOR_CLI_4}" ## Blue
    echo -en "\033]P5${THEME_COLOR_CLI_5}" ## Magenta
    echo -en "\033]P6${THEME_COLOR_CLI_6}" ## Cyan
    echo -en "\033]P7${THEME_COLOR_CLI_7}" ## White
    echo -en "\033]P8${THEME_COLOR_CLI_8}" ## Bright Black
    echo -en "\033]P9${THEME_COLOR_CLI_9}" ## Bright Red
    echo -en "\033]PA${THEME_COLOR_CLI_A}" ## Bright Green
    echo -en "\033]PB${THEME_COLOR_CLI_B}" ## Bright Yellow
    echo -en "\033]PC${THEME_COLOR_CLI_C}" ## Bright Blue
    echo -en "\033]PD${THEME_COLOR_CLI_D}" ## Bright Magenta
    echo -en "\033]PE${THEME_COLOR_CLI_E}" ## Bright Cyan
    echo -en "\033]PF${THEME_COLOR_CLI_F}" ## Bright White

    ####################
    ##     CURSOR     ##
    ####################
#    ## Default cursor (blinking underscore).
#    echo -en "\e[?;;c"

#    echo -en "\e[?;;c"
#echo -en "\e[?25h"


    ####################
    ##      FONT      ##
    ####################
    ## Load unicode font support.
    unicode_start

    ## Set PSFU font manually.
    [ -f '/usr/share/consolefonts/Uni1-Fixed16.psf.gz' ] && \
        setfont Uni1-Fixed16

    ####################
    ##    KEYBOARD    ##
    ####################
    ## Set up numlock, capslock and scrolllock.
    setleds -D +num
    setleds -D -caps
    setleds -D -scroll
fi

## Unset temporary (non-exported) variables.
unset THEME THEME_COLOR_CLI_0 THEME_COLOR_CLI_1 THEME_COLOR_CLI_2 \
THEME_COLOR_CLI_3 THEME_COLOR_CLI_4 THEME_COLOR_CLI_5 THEME_COLOR_CLI_6 \
THEME_COLOR_CLI_7 THEME_COLOR_CLI_8 THEME_COLOR_CLI_9 THEME_COLOR_CLI_A \
THEME_COLOR_CLI_B THEME_COLOR_CLI_C THEME_COLOR_CLI_D THEME_COLOR_CLI_E \
THEME_COLOR_CLI_F

## Set tab width to 4 (default: 8).
tabs 4

## Security clear.
#clear


########################################
##               THEMES               ##
########################################
## See: https://terminal.sexy.

## Theme selection.
#THEME='1337'
THEME='github-dark'
#THEME='hybrid'

if [ "${THEME}" = '1337' ]; then
    COLOR='00ff00'
    THEME_COLOR_CLI_0='000000' ## Black
    THEME_COLOR_CLI_1="${COLOR}" ## Red
    THEME_COLOR_CLI_2="${COLOR}" ## Green
    THEME_COLOR_CLI_3="${COLOR}" ## Yellow
    THEME_COLOR_CLI_4="${COLOR}" ## Blue
    THEME_COLOR_CLI_5="${COLOR}" ## Magenta
    THEME_COLOR_CLI_6="${COLOR}" ## Cyan
    THEME_COLOR_CLI_7="${COLOR}" ## White
    THEME_COLOR_CLI_8="${COLOR}" ## Bright Black
    THEME_COLOR_CLI_9="${COLOR}" ## Bright Red
    THEME_COLOR_CLI_A="${COLOR}" ## Bright Green
    THEME_COLOR_CLI_B="${COLOR}" ## Bright Yellow
    THEME_COLOR_CLI_C="${COLOR}" ## Bright Blue
    THEME_COLOR_CLI_D="${COLOR}" ## Bright Magenta
    THEME_COLOR_CLI_E="${COLOR}" ## Bright Cyan
    THEME_COLOR_CLI_F="${COLOR}" ## Bright White
## Github Dark theme: https://github.com/vv9k/vim-github-dark.
elif [ "${THEME}" = 'github-dark' ]; then
    THEME_COLOR_CLI_0='0d1117' ## Black
    THEME_COLOR_CLI_1='fa7970' ## Red
    THEME_COLOR_CLI_2='7ce38b' ## Green
    THEME_COLOR_CLI_3='faa356' ## Yellow
    THEME_COLOR_CLI_4='77bdfb' ## Blue
    THEME_COLOR_CLI_5='cea5fb' ## Magenta
    THEME_COLOR_CLI_6='a2d2fb' ## Cyan
    THEME_COLOR_CLI_7='ecf2f8' ## White
    THEME_COLOR_CLI_8='89929b' ## Bright Black
    THEME_COLOR_CLI_9='fa7970' ## Bright Red
    THEME_COLOR_CLI_A='7ce38b' ## Bright Green
    THEME_COLOR_CLI_B='faa356' ## Bright Yellow
    THEME_COLOR_CLI_C='77bdfb' ## Bright Blue
    THEME_COLOR_CLI_D='cea5fb' ## Bright Magenta
    THEME_COLOR_CLI_E='a2d2fb' ## Bright Cyan
    THEME_COLOR_CLI_F='ffffff' ## Bright White
## Hybrid theme: https://github.com/devinceble/Elementary-OS-Terminal-Colors/blob/master/images/Hybrid.png.
elif [ "${THEME}" = 'hybrid' ]; then
    THEME_COLOR_CLI_0='282a2e' ## Black
    THEME_COLOR_CLI_1='a54242' ## Red
    THEME_COLOR_CLI_2='8c9440' ## Green
    THEME_COLOR_CLI_3='de935f' ## Yellow
    THEME_COLOR_CLI_4='5f819d' ## Blue
    THEME_COLOR_CLI_5='85678f' ## Magenta
    THEME_COLOR_CLI_6='5e8d87' ## Cyan
    THEME_COLOR_CLI_7='969896' ## White
    THEME_COLOR_CLI_8='373b41' ## Bright Black
    THEME_COLOR_CLI_9='cc6666' ## Bright Red
    THEME_COLOR_CLI_A='b5bd68' ## Bright Green
    THEME_COLOR_CLI_B='f0c674' ## Bright Yellow
    THEME_COLOR_CLI_C='81a2be' ## Bright Blue
    THEME_COLOR_CLI_D='b294bb' ## Bright Magenta
    THEME_COLOR_CLI_E='8abeb7' ## Bright Cyan
    THEME_COLOR_CLI_F='c5c8c6' ## Bright White
fi


