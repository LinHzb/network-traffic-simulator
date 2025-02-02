
---

# Simulador de Tráfego de Rede com Bash 🚦

## Descrição
Este projeto é um **Simulador de Tráfego de Rede** desenvolvido em **Bash**, ideal para realizar simulações de tráfego, verificar a conectividade de hosts e visualizar informações detalhadas sobre interfaces de rede. Ele gera logs completos e possui uma estrutura modular para facilitar a manutenção e expansão.

## Funcionalidades
- **Simulação de Ping:** Teste a conectividade de hosts ou IPs.
- **Envio de Tráfego TCP/UDP:** Simula o envio de pacotes através de `netcat`.
- **Exibição de Estatísticas de Rede:** Mostra informações sobre interfaces de rede ativas.
- **Logs Detalhados:** Registra todas as ações com timestamp para facilitar o rastreamento.
- **Limpeza de Logs:** Permite a exclusão de logs antigos com confirmação.

## Estrutura do Projeto
```bash
.
├── simulator.sh         # Script principal para execução
├── functions.sh         # Funções auxiliares
├── logs/                # Diretório de logs gerados
└── README.md            # Documentação do projeto
```

## Como Usar

### 1. Clonar o Repositório
Clone o repositório em sua máquina e acesse o diretório do projeto:
```bash
git clone link aqui
cd simulador-trafego-bash
```

### 2. Executar o Simulador
Execute o simulador com o seguinte comando:
```bash
bash simulator.sh
```

### 3. Menu Interativo
O script exibe um menu interativo com as opções:
- **Simular Ping:** Realiza o teste de conectividade de um host.
- **Simular Tráfego TCP/UDP:** Envia tráfego TCP/UDP para uma porta e protocolo especificados.
- **Estatísticas de Rede:** Exibe informações sobre as interfaces de rede ativas.
- **Sair:** Encerra o simulador.

## Detalhes das Funções

### `simulate_ping()`
Realiza um teste de ping no host ou IP fornecido, verificando a conectividade.

### `simulate_traffic()`
Simula o envio de tráfego TCP ou UDP usando `netcat`, permitindo o envio de uma mensagem personalizada para uma porta especificada.

### `show_network_stats()`
Exibe as interfaces de rede ativas e as estatísticas detalhadas de rede, como pacotes transmitidos e recebidos.

### `validate_host()`
Valida a acessibilidade de um host/IP, realizando um ping simples.

### `log_message()`
Captura e registra logs com um timestamp, facilitando o rastreamento de atividades.

### `print_divider()`
Exibe uma linha divisória estilizada para organizar a saída no terminal.

## Exemplo de Uso

### Simulação de Ping
```bash
$ bash simulator.sh
Escolha uma opção:
1) Simular Ping
2) Simular Tráfego TCP/UDP
3) Estatísticas de Rede
4) Sair

Opção: 1
Digite o host/IP: 8.8.8.8
🔄 Pingando 8.8.8.8...
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=56 time=17.237 ms
...
✅ Resultados salvos em: ./logs/ping_20250202_123456.log
```

### Estatísticas de Rede
```bash
Escolha uma opção:
1) Simular Ping
2) Simular Tráfego TCP/UDP
3) Estatísticas de Rede
4) Sair

Opção: 3
Interfaces Ativas:
enp0s3
wlan0

Estatísticas Detalhadas:
enp0s3: 10 packets received, 10 packets transmitted
wlan0: 12 packets received, 12 packets transmitted
```

## Melhoria Contínua
Este projeto está em constante evolução. Contribuições são bem-vindas para expandir funcionalidades, corrigir erros ou adicionar novas simulações.

## Avisos
- **Uso Educacional:** Este simulador foi projetado para fins educacionais e de teste.
- **Responsabilidade:** Use-o com responsabilidade, especialmente ao testar tráfego em redes reais.

## Licença
Este projeto está licenciado sob a [Licença MIT](LICENSE).

---
