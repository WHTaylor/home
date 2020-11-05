function start_payara {
    asadmin start-domain --debug --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
}

function stop_payara {
    asadmin stop-domain --domaindir "$PAYARA_DOMAINS_DIR" "domain$1"
}

function find_deploy_target {
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
        proposal-lookup)source_dir="$APPS_HOME_FOLDER/Schedule/proposal-lookup";
                        target_ext="war";;
        *)              return -1;;
    esac
    echo $(find $source_dir -wholename $source_dir/*/target/$1*.$target_ext);
}

function find_deployed_application {
    local retval=$(asadmin list-applications | grep $1 | cut -d ' ' -f1)
    echo $retval
}

function deploy {
    local app_name=$(find_deploy_target $1)
    if [ -z $app_name ]; then
        echo "Application has not been built or does not exist"
        return -1;
    fi
    asadmin deploy $app_name;
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

# Never truncate history
export HISTFILESIZE=
export HISTSIZE=
