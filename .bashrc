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
    esac
    DEPLOY_TARGET=$(find $source_dir -wholename $source_dir/*/target/$1*.$target_ext);
}

function set_undeploy_target {
    local orig_deploy_target=$DEPLOY_TARGET;
    set_deploy_target $1;
    UNDEPLOY_TARGET=$(basename $DEPLOY_TARGET);
    UNDEPLOY_TARGET="${UNDEPLOY_TARGET%.*}";
    DEPLOY_TARGET=$orig_deploy_target;
}

function deploy {
	set_deploy_target $1
	asadmin deploy $DEPLOY_TARGET;
}

function undeploy {
	set_undeploy_target $1
	asadmin undeploy $UNDEPLOY_TARGET;
}

function local_logs {
	explorer "$PAYARA_DOMAINS_DIR\\domain$1\\logs"
}
