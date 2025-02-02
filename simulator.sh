#!/bin/bash

# Importar funções auxiliares
source ./functions.sh

# Cores ANSI
cyan="\033[0;36m"
green="\033[0;32m"
yellow="\033[0;33m"
red="\033[0;31m"
reset="\033[0m"

# Variáveis globais
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

# Banner estilizado
function print_banner() {
  clear
  echo -e "${cyan}"
  echo "╔══════════════════════════════════════════╗"
  echo "║    🚦 SIMULADOR DE TRÁFEGO DE REDE 🚀    ║"
  echo "║              By: LineKaro                ║"
  echo "╚══════════════════════════════════════════╝"
  echo -e "${reset}"
}

# Menu estilizado
function main_menu() {
  print_banner
  echo -e "${green}Escolha uma opção:${reset}"
  echo -e "${yellow}1)${reset} Simular Ping"
  echo -e "${yellow}2)${reset} Simular Tráfego TCP/UDP"
  echo -e "${yellow}3)${reset} Estatísticas de Rede"
  echo -e "${yellow}4)${reset} Sair"
  echo -e "\n${cyan}►► ${reset}"
  read -rp "Opção: " option

  case $option in
    1) simulate_ping ;;
    2) simulate_traffic ;;
    3) show_network_stats ;;
    4) echo -e "\n${green}🛑 Saindo...${reset}"; exit 0 ;;
    *) echo -e "${red}❌ Opção inválida!${reset}"; sleep 1; main_menu ;;
  esac
}

# Simulação de Ping (Estilizada)
function simulate_ping() {
  print_banner
  echo -e "${green}🎯 SIMULAÇÃO DE PING${reset}"
  echo -e "${cyan}──────────────────────────────${reset}\n"
  
  read -rp "Digite o host/IP: " host
  log_file="$LOG_DIR/ping_$(date +%Y%m%d_%H%M%S).log"
  
  echo -e "\n${yellow}🔄 Pingando $host...${reset}"
  ping -c 5 -W 2 "$host" | tee "$log_file"
  
  echo -e "\n${green}✅ Resultados salvos em:${reset} ${yellow}$log_file${reset}"
  read -rp "Pressione Enter para continuar..."
  main_menu
}

# Simulação de Tráfego (Estilizada)
function simulate_traffic() {
  print_banner
  echo -e "${green}🌐 SIMULAÇÃO DE TRÁFEGO${reset}"
  echo -e "${cyan}──────────────────────────────${reset}\n"
  
  # Coletar dados
  read -rp "Porta de destino: " port
  [[ ! "$port" =~ ^[0-9]+$ ]] && echo -e "${red}🚨 Porta inválida!${reset}" && sleep 1 && main_menu
  
  read -rp "Protocolo (tcp/udp): " protocol
  case "$protocol" in
    tcp|udp) ;;
    *) echo -e "${red}🚨 Protocolo inválido!${reset}"; sleep 1; main_menu ;;
  esac

  read -rp "Mensagem: " message
  log_file="$LOG_DIR/traffic_$(date +%Y%m%d_%H%M%S).log"

  # Configurar Netcat
  nc_args=""; [ "$protocol" == "udp" ] && nc_args="-u"

  # Iniciar servidor
  echo -e "\n${yellow}🖥️ Iniciando servidor $protocol na porta $port...${reset}"
  nc $nc_args -l -p "$port" >> "$log_file" 2>&1 &
  server_pid=$!
  
  # Animação de espera
  echo -ne "${cyan}⏳ Aguardando conexão...${reset}"
  sleep 2
  echo -e "\r${green}✅ Servidor ativo!     ${reset}"

  # Enviar dados
  echo -e "${yellow}📤 Enviando mensagem...${reset}"
  echo "$message" | nc $nc_args localhost "$port"
  
  # Finalizar
  sleep 2
  kill $server_pid >/dev/null 2>&1
  echo -e "\n${green}📝 Log gerado em:${reset} ${yellow}$log_file${reset}"
  read -rp "Pressione Enter para continuar..."
  main_menu
}

# Estatísticas de Rede (Estilizada)
function show_network_stats() {
  print_banner
  echo -e "${green}📊 ESTATÍSTICAS DE REDE${reset}"
  echo -e "${cyan}──────────────────────────────${reset}\n"
  
  echo -e "${yellow}🔗 Interfaces Ativas:${reset}"
  show_active_interfaces
  echo
  
  echo -e "${yellow}📦 Estatísticas Detalhadas:${reset}"
  ip -s link show | grep -v "loopback"
  
  echo -e "\n${cyan}──────────────────────────────${reset}"
  read -rp "Pressione Enter para continuar..."
  main_menu
}

# Iniciar
main_menu