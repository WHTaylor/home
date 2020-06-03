function start_payara {
    asadmin start-domain --debug --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
}

function stop_payara {
    asadmin stop-domain --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
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
	explorer "$PAYARA_DOMAINS_DIR\\domain$1\\logs"
}
