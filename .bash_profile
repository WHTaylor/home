# Never truncate history
export HISTFILESIZE=
export HISTSIZE=

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bashrc && . ~/.bashrc

[[ "rop61488" == $USERNAME ]] && . ~/bash/work/.bash_profile
