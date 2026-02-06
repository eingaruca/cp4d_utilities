#!/usr/bin/env bash
set -euo pipefail

os_require_root() {
  if [ "${EUID}" -ne 0 ]; then
    log_warn "No eres root. Re-ejecutando con sudo..."
    exec sudo -E bash "$0" "$@"
  fi
}

os_pkg_install() {
  local pkgs=("$@")

  if command -v dnf >/dev/null 2>&1; then
    log_info "Instalando paquetes con dnf: ${pkgs[*]}"
    dnf install -y "${pkgs[@]}"
  elif command -v yum >/dev/null 2>&1; then
    log_info "Instalando paquetes con yum: ${pkgs[*]}"
    yum install -y "${pkgs[@]}"
  else
    log_error "No se detecta dnf ni yum. OS no soportado."
    return 1
  fi

  log_success "Paquetes instalados: ${pkgs[*]}"
}
