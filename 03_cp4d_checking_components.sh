#!/bin/bash

# Paths
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="${ROOT_DIR}/conf"
LIB_DIR="${ROOT_DIR}/lib"
# Loading modules
. "${LIB_DIR}/logs.sh"

log_info "Testing cpd-cli"
log_info "Restarting: cpd-cli manage restart-container"

source ~/.bashrc  
which cpd-cli
# echo $CPD_CLI_MANAGE_WORKSPACE
# export CPD_CLI_MANAGE_WORKSPACE=/home/eldomanu/cp4d/cpd-cli/
cpd-cli version
cpd-cli manage restart-container