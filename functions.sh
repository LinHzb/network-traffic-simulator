#!/bin/bash

# Função para exibir divisória estilizada
function print_divider() {
  echo -e "${cyan}──────────────────────────────${reset}"
}

# Valida host com animação
function validate_host() {
  local host=$1
  echo -ne "${yellow}🔍 Validando $host...${reset}"
  if ping -c 1 "$host" &>/dev/null; then
    echo -e "\r${green}✅ $host está acessível!    ${reset}"
    return 0
  else
    echo -e "\r${red}❌ $host não alcançado!   ${reset}"
    return 1
  fi
}

# Log com emojis e cores
function log_message() {
  local message=$1
  local log_file=$2
  echo -e "[$(date +%Y-%m-%d\ %H:%M:%S)] ${cyan}📝${reset} $message" | tee -a "$log_file"
}