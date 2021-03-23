alias tailf="tail -f"
alias ll="ls -alF"

alias apps="cd $APPS_HOME_FOLDER"
alias fbs="cd /c/FBS/Apps"
alias icat="cd ~/projects/isis-icat"

alias mvnci="mvn clean install -DskipTests"
alias update_wsdl='py $APPS_HOME_FOLDER/ISISBusApps/Tools/WsdlUpdater/wsdl_updater.py'
alias search_code="grep -rI --exclude={\*.wsdl,Reference.cs,Reference1.cs,\*.html,\*.class,\*.xml,\*.xsd,\*.designer.cs} --exclude-dir={bin,obj}"
alias scs='grep -r --include \*.cs'
alias bgb='mvnci &> ~/build &'

alias morning="start_payara 1 & docker start oracleXE"
