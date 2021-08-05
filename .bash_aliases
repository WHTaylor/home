alias tailf="tail -f"
alias ll="ls -alF"
alias scs='grep -r --include \*.cs'

alias pftrt='pip freeze > requirements.txt' # Let's see if I remember this exists

alias g=git
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
