alias tailf="tail -f"
alias cdl="cd $1 && ll"
alias mcd="mkdir $1 && cd $1"
alias ll="ls -alF"

alias apps="cd $APPS_HOME_FOLDER"
alias fbs="cd /c/FBS/Apps"

alias mvnci="mvn clean install -DskipTests"
alias update_wsdl='py $APPS_HOME_FOLDER/ISISBusApps/Tools/WsdlUpdater/wsdl_updater.py'
alias search_code="grep -r --exclude={\*.wsdl,Reference.cs,Reference1.cs,\*.pdb,\*.dll,\*.html,\*.class,\*.xml,\*.xsd}"

alias morning="start_payara 1 & docker start oracleXE"
