alias tailf="tail -f"
alias ll="ls -alF"
function mkcd { mkdir -p $1; cd $1; }

alias scs='grep -r --include \*.cs'
alias freeze-req='pip freeze > requirements.txt'

alias g=git
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
