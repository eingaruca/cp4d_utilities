#!/usr/bin/env bash
set -euo pipefail

###########################################################
# CP4D Main Menu
# Autor: Eldo I.
###########################################################

# Paths 
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF_DIR="${ROOT_DIR}/conf"
LIB_DIR="${ROOT_DIR}/lib"

# Loading modules
. "${LIB_DIR}/logs.sh"

if [ -f "${CONF_DIR}/env.sh" ]; then
  # . "${CONF_DIR}/env"
  source "${CONF_DIR}/env.sh"
  log_info "Variables cargadas desde conf/env.sh"
else
  log_warn "No existe fichero conf/env.sh"
fi

# sudo -i

# # Checking dependencies
# require_cmd() { 
#   for c in "$@"; do
#     command -v "$c" >/dev/null 2>&1 || {
#       log_error "Falta comando requerido: $c"
#       exit 1
#     }
#   done
# }

# require_cmd bash tar jq
# command -v wget >/dev/null 2>&1 || command -v curl >/dev/null 2>&1 || {
#   log_error "Necesitas 'wget' o 'curl' para descargar artefactos."
#   exit 1
# }

# === Main Menu ===
show_menu() {
  cat <<'EOF'
==================== CP4D - Launcher ====================
1) Instalar / actualizar cpd-cli
q) Salir
=========================================================
EOF
}

# === Menu ===
while true; do
  show_menu
  read -rp "Elige una opción: " opt
  case "${opt}" in
    1)
      sleep 1
      log_info "Ejecutando módulo 01_install_cpd-cli.sh..."
      "${ROOT_DIR}/01_install_cpd-cli.sh"
      ;;
    q|Q)
      log_info "Saliendo..."
      exit 0
      ;;
    *)
      log_warn "Opción no válida."
      ;;
  esac
done