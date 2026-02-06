#!/bin/bash

# Paths
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="${ROOT_DIR}/conf"
LIB_DIR="${ROOT_DIR}/lib"

# Loading modules
. "${LIB_DIR}/logs.sh"

log_info "Estoy en 01_install_cpd-cli.sh"

# log_info $PATH_CPD_CLI

# Variables
CPD_CLI_PLATFORM=linux
CPD_CLI_EDITION=EE
# Example https://github.com/IBM/cpd-cli/releases/download/v13.1.9/cpd-cli-linux-EE-13.1.9.tgz
CPD_TGZ="cpd-cli-${CPD_CLI_PLATFORM}-${CPD_CLI_EDITION}-${CPD_CLI_VERSION}.tgz"
CPD_CLI_URL="https://github.com/IBM/cpd-cli/releases/download/v$CPD_CLI_VERSION/$CPD_TGZ"
log_info "File $CPD_TGZ"

if [ -f $CPD_TGZ ]; then
    log_warn "Fichero ya existe, no se descarga"
    log_warn "File ==> "`(ls -l $CPD_TGZ)`

else
    log_info "Descargamos cpd-cli"
    wget $CPD_CLI_URL
fi



if [ -f $CPD_TGZ ]; then
    echo "Hola"
fi
# mkdir cpd-cli; cd cpd-cli