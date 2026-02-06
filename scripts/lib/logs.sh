#!/usr/bin/env bash

# === Colores ===
BLUE="\033[34m"
YELLOW="\033[33m"
RED="\033[31m"
GREEN="\033[32m"
NC="\033[0m"

# === Funciones de log ===
log_info()    { echo -e "[${BLUE}INFO${NC}] $*"; }
log_warn()    { echo -e "[${YELLOW}WARN${NC}] $*" >&2; }
log_error()   { echo -e "[${RED}ERROR${NC}] $*" >&2; }
log_success() { echo -e "[${GREEN}OK${NC}] $*"; }