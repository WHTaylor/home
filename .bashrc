# Print a random quote
if [[ -r ~/quotes ]]; then
    quote=$(shuf -n 1 ~/quotes)
    echo "- $quote -"
fi

# Go up n directories
function up {
    if [ $# -eq 0 ]; then
        cd ..
        return 0;
    fi;

    local n;
    if [[ $1 =~ ^[0-9]+$ ]]; then
        local old=$PWD;
        for ((i=0; i<$1; i++)); do
            cd ..;
        done;
        export OLDPWD=$old;
    else
        echo "Argument must be a number"
        return 1
    fi;

}

[[ "rop61488" == $USERNAME ]] && . ~/bash/work/.payara_functions
