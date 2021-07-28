# Print a random quote
test -f ~/quotes && shuf -n 1 ~/quotes;

test -f ~/bash/.payara_functions && . ~/bash/.payara_functions

# Go up n directories, where n is:
#  - The first argument if it's an integer, otherwise
#  - The length of the first argument
function up {
    if [ $# -eq 0 ]; then
        return 0;
    fi;

    local n;
    if [[ $1 =~ ^[0-9]+$ ]]; then
        n=$1;
    else
        n=${#1};
    fi;

    local old=$PWD;
    for ((i=0; i<$n; i++)); do
        cd ..;
    done;
    export OLDPWD=$old;
}
