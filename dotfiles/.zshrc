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
    function zle_application_mode_start { echoti smkx; }
    function zle_application_mode_stop  { echoti rmkx; }
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
if [ -n "$(command -vp less)" ]; then
    export PAGER='less'
else
    export PAGER=''
fi
export MANPAGER="${PAGER}"

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
export MANLESS='[Manual\: \$MAN_PN\] | Lines\: %lt-%lb/%L (?e100:%Pb.\%)]$'

## Color mode.
#export COLOR_MODE='always'
export COLOR_MODE='auto'

################################################################################
##                                  ALIASES                                   ##
################################################################################
########################################
##               SET UP               ##
########################################
## Unalias all previous aliases.
unalias -a

########################################
##          COMMAND OPTIONS           ##
########################################
## Kernel
alias dmesg='\dmesg --color=${COLOR_MODE}'

## System.
alias pstree='\pstree -C age -h'
alias date='\date "+%Y-%m-%d %H:%M:%S %Z"'
alias history='\history 0'

## Filesystem.
alias mkdir='\mkdir -p'
alias ls='\ls --color=${COLOR_MODE} -F --group-directories-first'
alias tree='\tree -C'
alias file='\file -p'

## Text reading.
alias grep='\grep --color=${COLOR_MODE}'
alias egrep='\grep -E --color=${COLOR_MODE}'
alias fgrep='\grep -F --color=${COLOR_MODE}'
alias diff='\diff --color=${COLOR_MODE} -s'
if [ "${TERM}" = 'linux' ]; then
    alias bat='\bat --style=plain --paging=auto --color=${COLOR_MODE}'
else
    alias bat='\bat --style=full --paging=auto --color=${COLOR_MODE}'
fi
alias nl='\nl -s " "'

## Multimedia.
alias mpv='\mpv --audio-display=no'

## Network.
alias ip='\ip --color=${COLOR_MODE}'
alias mtr='\mtr -t'

########################################
##            ALTERNATIVES            ##
########################################
## Filesystem.
if [ -n "$(command -vp lsd)" ]; then
    alias ls='\lsd --color=${COLOR_MODE} -F --group-dirs first --icon never'
fi

## Text reading.
if [ -n "$(command -vp bat)" ]; then
    alias cat='\bat --style=plain --paging=auto --color=${COLOR_MODE}'
fi
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

## Gaming.
alias nvrun='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'

################################################################################
##                                 FUNCTIONS                                  ##
################################################################################
########################################
##               SHELL                ##
########################################
## Get true shell name for executed script - resolves "sh".
## Original script: 'https://stackoverflow.com/questions/23011370/how-to-recognize-whether-bash-or-dash-is-being-used-within-a-script'.
getshell() {
    LOGIN_SHELL=''

    ## Determine the shell executable filename.
    if [ -r "/proc/${$}/cmdline" ]; then
        SHELL_NAME=$(cut -d '' -f 1 "/proc/${$}/cmdline") || return 1
    else
        SHELL_NAME=$(ps -p "${$}" -o comm=) || return 1
    fi

    ## Strip a leading '-' for login shells but save it in variable.
    if [ ! "${SHELL_NAME#-}" = "${SHELL_NAME}" ]; then
        LOGIN_SHELL='-'
        SHELL_NAME=${SHELL_NAME#-}
    fi

    ## Determine full executable path.
    [ "${SHELL_NAME#/}" != "${SHELL_NAME}" ] || SHELL_NAME=$([ -n "${ZSH_VERSION}" ] && which -p "${SHELL_NAME}" || which "${SHELL_NAME}")

    ## If the executable is a symlink, resolve it to its *ultimate* target.
    while NEXT_TARGET=$(readlink "${SHELL_NAME}"); do
        SHELL_NAME=${NEXT_TARGET}
    done

    ## Output the executable name only.
    printf '%s\n' "${LOGIN_SHELL}$(basename "${SHELL_NAME}")"
}

########################################
##               SYSTEM               ##
########################################
## System update.
sysupdate() {
    ## Debian-based systems.
    if [ -f '/etc/debian_version' ]; then
        doas sh -c 'apt update && apt full-upgrade && apt autoremove && apt clean'
    fi
}

## Print date in ISO 8601 format.
idate() {
    \date '+%Y-%m-%dT%H:%M:%S%z'
}

## Print process name of a PID.
pname() {
    for i in "${@}"; do
        ps -p "${i}" -o cmd -h
    done
}

########################################
##             FILESYSTEM             ##
########################################
## Create directory and immediately cd to it.
mcd() {
    mkdir -p -- "${1}"
    cd -- "${1}"
}

## Copy files (all, even hidden) from directory.
cpf() {
    cp -rTd -- "${@}"
}

## Print full path to specified file(s).
path() {
    readlink -f -- "${@}"
}

########################################
##             MULTIMEDIA             ##
########################################
####################
##      MP3       ##
####################
## Download mp3 song in a best audio quality.
ytmp3() {
    yt-dlp -ix --progress -f bestaudio --audio-quality 0 --audio-format mp3 \
    -o '%(title)s.%(ext)s' -- "${@}"
}

## Put all audio files to the same volume.
mp3normalize() {
    mp3gain -r -k -- "${@}"
}
