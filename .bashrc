function start_payara {
    asadmin start-domain --debug --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
}

function stop_payara {
    asadmin stop-domain --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
}

function set_deploy_target {
    local source_dir;
    local target_ext;
    case $1 in
        users-services) source_dir="$APPS_HOME_FOLDER/users/users";
                        target_ext="war";;
        users-frontend) source_dir="$APPS_HOME_FOLDER/users/users";
                        target_ext="war";;
        schedule)       source_dir="$APPS_HOME_FOLDER/Schedule/SchedulePackage";
                        target_ext="war";;
        visits)         source_dir="$APPS_HOME_FOLDER/Visits/VisitsPackage";
                        target_ext="war";;
    esac
    DEPLOY_TARGET=$(find $source_dir -wholename $source_dir/*/target/$1*.$target_ext);
}

function find_deployed_application {
    local retval=$(asadmin list-applications | grep $1 | cut -d ' ' -f1)
    echo $retval
}

function deploy {
	set_deploy_target $1
	asadmin deploy $DEPLOY_TARGET;
}

function undeploy {
    local app_name=$(find_deployed_application $1)
    if [ -z $app_name ]; then
        echo "No app with matching name deployed";
        return -1;
    fi

	asadmin undeploy $app_name;
}

function local_logs {
	explorer "$PAYARA_DOMAINS_DIR\\domain$1\\logs"
}
