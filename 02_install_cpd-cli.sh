#!/bin/bash

# Paths
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="${ROOT_DIR}/conf"
LIB_DIR="${ROOT_DIR}/lib"

# Loading modules
. "${LIB_DIR}/logs.sh"

log_info "Opción 1, instalando cpd-cli"
log_info "Cambiando a $CPD_CLI_PATH"
mkdir ${CPD_CLI_PATH}
cd $CPD_CLI_PATH
pwd

# Variables
CPD_CLI_PLATFORM=linux
CPD_CLI_EDITION=EE
# Example https://github.com/IBM/cpd-cli/releases/download/v13.1.9/cpd-cli-linux-EE-13.1.9.tgz
CPD_TGZ="cpd-cli-${CPD_CLI_PLATFORM}-${CPD_CLI_EDITION}-${CPD_CLI_VERSION}.tgz"
CPD_CLI_URL="https://github.com/IBM/cpd-cli/releases/download/v$CPD_CLI_VERSION/$CPD_TGZ"
log_info "File $CPD_TGZ"


# Download file
if [ -f $CPD_TGZ ]; then
    log_warn "Fichero ya existe, no se descarga"
    log_warn "File ==> "`(ls -l $CPD_TGZ)`
else
    log_info "Descargamos cpd-cli"
    # wget -q --show-progress -O $CPD_TGZ $CPD_CLI_URL
    wget -q --show-progress $CPD_CLI_URL
fi


# Uncompressing file
if [ -f $CPD_TGZ ]; then
    log_info "Detectando directorio raíz del tgz..."
    CPD_EXTRACTED_DIR="$(tar -tf "${CPD_TGZ}" | head -n1 | cut -d/ -f1)"
    log_info "Directorio detectado: ${CPD_EXTRACTED_DIR}"
    log_info "Extrayendo ${CPD_TGZ}..."
    tar -xf "${CPD_TGZ}"
    log_success "Descomprimido" $CPD_EXTRACTED_DIR
else
    log_error "No se ha descargado fichero"
fi


# Symbolic Link
log_info "Cambiando Enlace simbólico a nueva versión"
ln -s $CPD_EXTRACTED_DIR cpd-cli
rm -f $CPD_TGZ
CPD_PATH_LINK=$(pwd)/cpd-cli
echo $CPD_PATH_LINK
# Adding to Path
cat >> ~/.bashrc <<EOF

# CPD CLI
export PATH=${CPD_PATH_LINK}:\$PATH
export CPD_CLI_MANAGE_WORKSPACE=${CPD_PATH_LINK}
EOF

source ~/.bashrc

sleep 1
log_info "Hacer source ~/.bashrc"
sleep 1
log_info "Hacer source ~/.bashrc"
sleep 1
log_info "Hacer source ~/.bashrc"