# Never truncate history
export HISTFILESIZE=
export HISTSIZE=

export PATH=$PATH:/c/payara/installations/payara-4.1.2.181/payara41/bin
export APPS_HOME_FOLDER="/c/Users/rop61488/Documents/Apps"
export PAYARA_DOMAINS_DIR="C:\\payara\\domains"
export DEV_LOGS="\\\\fitbawebdev\\d$\\payara\\domains\\domain1\\logs"
export PROD_LOGS="\\\\fitbaweb1\\d$\\payara\\domains\\domain1\\logs"
export LOCAL_LOGS="$PAYARA_DOMAINS_DIR/domain1/logs"

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bashrc && . ~/.bashrc
