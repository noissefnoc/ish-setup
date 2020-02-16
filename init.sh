#!/bin/ash

##############################################################
# init.sh: initialize processing on my iSH environment update
##############################################################

# global bariables
RET_SUCCESS=0
RET_FAILER=1

USER_SHELL=''
USER_NAME=''


# utility functions
parse_arguments() {
    # in case no argument passed
    if [ -z ${@} ]; then
        usage ${RET_SUCCESS}
    fi

    # in case not two argument (or more) argument passed
    if [ ! -n ${1} && ! -n ${2} ]; then
        echo "ERROR: invalid argument"
        usage ${RET_FAILER}
    fi
    
    USER_SHELL=${1}
    USER_NAME=${2}
    
    return ${RET_SUCCESS}
}

usage() {
    ORG_RET_STATUS=${1}
    echo "init.sh is initial environmental setup script for iSH."
    echo "Usage: init.sh CREATE_USER_SHELL CREATE_USER_NAME"
    exit ${ORG_RET_STATUS}
}


# exec functions
update_package_meta() {
    apk update
    return ${?}
}

install_packages() {
    apk add make git zsh vim curl jq
    return ${?}
}

create_user() {
    SHELL=${1}
    NAME=${2}
    SHELL_PATH=$(which ${USER_SHELL})

    # in case shell does not install
    if [ -z ${SHELL_PATH} ]; then
        echo "ERROR: invalid shell (${SHELL})"
        return ${RET_FAILER}
    fi
    
    adduser -s ${SHELL} ${NAME}
    
    return ${?}
}

main() {
    parse_argument ${1} ${2}
    update_package_meta
    install_packages
    create_user ${1} ${2}
}


# main routine
main ${1} ${2}