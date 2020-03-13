APPS_HOME_FOLDER="C:/Users/rop61488/Documents/Apps"
FBS_FOLDER="C:/FBS/Apps"
alias apps="cd $APPS_HOME_FOLDER"
alias fbs="cd $FBS_FOLDER"

LOCAL_PAYARA_DOMAINS_FOLDER="C:\\payara\\domains"
PAYARA_INSTALL_ASADMIN="C:/payara/installations/payara-4.1.2.181/payara41/bin/asadmin"

function start_payara_server {
	$PAYARA_INSTALL_ASADMIN "start-domain" "--debug" "--domaindir" "$LOCAL_PAYARA_DOMAINS_FOLDER" "domain$1"
}
alias start_payara='start_payara_server 1; start_payara_server 2;'

function stop_payara {
	$PAYARA_INSTALL_ASADMIN "stop-domain" "--domaindir" "$LOCAL_PAYARA_DOMAINS_FOLDER" "domain$1"
}

#Global variables woo ( Actually :`( )
#TODO: find FILE_NAME dynamically so don't have to update when version changes
function set_ear_file {
	case $1 in
		schedule) FILE_NAME="schedule-ear-1.10.6"; EAR_PATH="$APPS_HOME_FOLDER/Schedule/SchedulePackage/ear/target" ;;
		visits) FILE_NAME="visits-ear-4.1"; EAR_PATH="$APPS_HOME_FOLDER/visits/VisitsPackage/visits-ear/target" ;;
		proposal-lookup) FILE_NAME="proposal-lookup-ear-1.10.1"; EAR_PATH="$APPS_HOME_FOLDER/Schedule/proposal-lookup/proposal-lookup-ear/target" ;;
		*) echo "Not a valid app to deploy"
	esac

	case $2 in
		deploy) EAR_FILE="$EAR_PATH/$FILE_NAME-SNAPSHOT.ear" ;;
		undeploy) EAR_FILE="$EAR_PATH/$FILE_NAME-SNAPSHOT" ;;
		*) echo "Invalid mode for set_ear_file, must be 'deploy' or 'undeploy'"
	esac;
}

function deploy {
	set_ear_file $1 "deploy"
	$PAYARA_INSTALL_ASADMIN "deploy" $EAR_FILE;
}

function undeploy {
	set_ear_file $1 "undeploy"
	$PAYARA_INSTALL_ASADMIN "undeploy" $EAR_FILE;
}

function local_logs {
	explorer "$LOCAL_PAYARA_DOMAINS_FOLDER\\domain$1\\logs"
}
