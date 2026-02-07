#!/bin/bash

log_info "Instalando paquetes..."

if yum install -y -q podman; then
  log_success "Podman instalado"
else
  log_error "Error instalando podman"
  exit 1
fi

sleep 1

if yum install -y -q jq; then
  log_success "jq instalado"
else
  log_error "Error instalando jq"
  exit 1
fi

if yum install -y -q tree; then
  log_success "Tree instalado"
else
  log_error "Error instalando tree"
  exit 1
fi