# Portfólio Técnico – Samuel Guigo

Bem-vindo ao meu portfólio!
Aqui compartilho projetos e configurações que desenvolvi na área de **Redes, Infraestrutura e Monitoramento**.

## 🔹 Projetos em Destaque
- **Mikrotik Avançado**
  - VPN (WireGuard, L2TP, OpenVPN)
  - Firewall, Failover, Load Balance
  - VLANs e IPv6

- **Servidor de Monitoramento**
  - Zabbix + Grafana + MySQL
  - Dashboards em tempo real
  - Alertas automáticos

- **Dashboards e Relatórios**
  - Consumo de banda
  - Disponibilidade de links
  - Alarmes e erros críticos

## 📜 Certificações Relevantes
- Mikrotik (Firewall, VPN, RouterOS)
- Huawei (VLAN, PPPoE, PBR, Virtual System)
- Cisco Networking Academy (Cybersecurity, Networking Basics)
- Zabbix, Grafana, MySQL

## 💾 Assistente de Backup (PowerShell)
Script gráfico para criar backups locais (ex.: do computador para o pendrive e vice-versa) usando PowerShell.

### Recursos
- Seleção de múltiplos arquivos e pastas.
- Escolha do destino do backup via interface.
- Barra de progresso com estimativa de tempo e status do arquivo atual.
- Lista de itens que não puderam ser copiados para conferência posterior.

### Como usar
1. Em um Windows com PowerShell 5.1 ou superior, permita a execução do script:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File .\BackupAssistant.ps1
   ```
2. Clique em **Adicionar Arquivo** ou **Adicionar Pasta** para montar a lista do que será copiado.
3. Selecione o destino (ex.: a letra do pendrive) em **Escolher**.
4. Clique em **Iniciar Backup** para começar a cópia. O progresso e a estimativa aparecem na parte inferior.
5. Caso algum item falhe, ele será listado em **Itens não copiados** para verificação manual.

> Observação: o script copia o que for possível e não interrompe o processo por causa de falhas individuais.
