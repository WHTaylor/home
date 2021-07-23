alias tailf="tail -f"
alias ll="ls -alF"
alias python="winpty python.exe"

alias nunit="nunit3-console.exe"

alias apps="cd $APPS_HOME_DIR"
alias fbs="cd /c/FBS/Apps"
alias icat="cd ~/projects/isis-icat"

alias mvnci="mvn clean install -DskipTests -Dmaven.javadoc.skip=true"
alias mvni="mvn install -DskipTests -Dmaven.javadoc.skip=true"
alias update_wsdl='py $APPS_HOME_DIR/ISISBusApps/Tools/WsdlUpdater/wsdl_updater.py'
alias search_code="grep -rI --exclude={\*.wsdl,Reference.cs,Reference1.cs,\*.html,\*.class,\*.xml,\*.xsd,\*.designer.cs} --exclude-dir={bin,obj,.git}"
alias scs='grep -r --include \*.cs'
alias bgb='mvnci &> ~/build &'
alias pftrt='pip freeze > requirements.txt' # Let's see if I remember this exists

alias morning="start_payara 1 & docker start oracleXE"

alias g=git
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main g
