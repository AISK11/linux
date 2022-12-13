## AUTHOR:       AISK11
## LOCATION:     ~/.profile (0644)
## DEPENDENCIES: dash
## DESCRIPTION:  Dash login shell ("-dash") reads commands from '/etc/profile'
##               and '~/.profile' if they exists.

## Read commands from file specified by "${ENV}" for each interactive shell.
export ENV=''

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

## Command prompts.
if [ "$(whoami)" = 'root' ]
then
    export PS1='# '
else
    export PS1='$ '
fi
export PS2='> '

## XDG environment.
export XDG_CONFIG_HOME="${HOME}/.config"
