# Never truncate history
export HISTFILESIZE=
export HISTSIZE=

export PATH="$PATH:/c/payara/installations/payara-4.1.2.181/payara41/bin:/usr/local/bin/nunit-3.12/net35"
export APPS_HOME_DIR="/c/Users/rop61488/Documents/Apps"
export PAYARA_DOMAINS_DIR="C:\\payara\\domains"
export DEV_LOGS="\\\\fitbawebdev\\d$\\payara\\domains\\domain1\\logs"
export PROD_LOGS="\\\\fitbaweb1\\d$\\payara\\domains\\domain1\\logs"
export LOCAL_LOGS="$PAYARA_DOMAINS_DIR/domain1/logs"
export ICAT_HOME_DIR="~/projects/isis-icat"

export CDPATH=".:$APPS_HOME_DIR:$ICAT_HOME_DIR"

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f ~/.bashrc && . ~/.bashrc
