# colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m"

# paths
DEPLOY_ROOT=./deploy/$(date +"%Y-%m-%d_%H%M%S")/
DEPLOY_ROOT=~/
BACKUP_ROOT=./backups/


copy_item () {
    from=$1
    to=$2
    
    COPY_COMMAND="cp"
    if [[ $from == */ ]]; then COPY_COMMAND="cp -r"; fi

    $COPY_COMMAND $from $to 2> /dev/null
    if [[ $? -eq 0 ]]; then
        result="copy"
        result_color=$GREEN
    else
        result="fail"
        result_color=$RED
    fi
    echo -e "  ${result_color}${result}${NC} $from"
}

diff_item () {
    from=$1
    to=$2

    echo -e "comparing ${BLUE}$from${NC} with ${BLUE}$to${NC}..."
    colordiff $from $to
}


create_backup () {
    backup_dir=${BACKUP_ROOT}$(date +"%Y-%m-%d_%H%M%S")/
    echo -e "backing up current files to ${BLUE}${backup_dir}${NC}..."
    mkdir -p $backup_dir
    cat targets | while read target; do copy_item ~/$target $backup_dir; done
}

do_deploy () {
    create_backup
    echo -e "deploying files to ${BLUE}${DEPLOY_ROOT}${NC}..."
    mkdir -p $DEPLOY_ROOT
    cat targets | while read target; do copy_item ./files/$target $DEPLOY_ROOT/$target; done
}

show_diff () {
    cat targets | while read target; do diff_item ~/$target ./files/$target; done
}

show_help () {
    echo -e "valid operations are: ${GREEN}backup${NC}, ${RED}deploy${NC}, and ${BLUE}diff${NC}"
}


OPERATION=$1
case $OPERATION in
    backup) create_backup;;
    deploy) do_deploy;;
    diff) show_diff;;
    *) show_help;;
esac
