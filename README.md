# Samuel Guigo — Engenharia de Infraestrutura, Redes e Segurança

Sou profissional de infraestrutura de TI, com atuação em **virtualização, Windows/Linux, redes, armazenamento, observabilidade, cibersegurança e Ethernet industrial/OT**.

Neste portfólio apresento projetos em que atuei, investigações de incidentes, implementações práticas, laboratórios e entregáveis de arquitetura. Para preservar a confidencialidade, não divulgo nomes de clientes, endereços internos, hostnames, credenciais ou topologias sensíveis.

## Encerramento técnico — outubro de 2026

- **[Handover técnico de infraestrutura corporativa](cases/enterprise-infrastructure-handover-2026/README.md):** atuei desde a implantação inicial do VMware ESXi/vCenter, criação e configuração das VMs e serviços Windows/Linux até a posterior migração para Proxmox, com atividades de segurança e monitoramento Wazuh/Zabbix. O aceite formal do cliente e outras verificações operacionais são etapas independentes.

## Trabalhos técnicos selecionados

- **[VMware → Proxmox](cases/proxmox-virtualization-migration/README.md):** participei da migração de VMs Windows/Linux para Proxmox VE, configuração de cluster, adaptação VirtIO/QEMU e validações por etapas.
- **[Armazenamento TrueNAS/ZFS](cases/truenas-zfs-storage/README.md):** implantei uma plataforma ZFS com seis discos SAS de 8 TB em JBOD e RAIDZ2, incluindo verificações SMART e integridade do pool.
- **[Anel Ethernet industrial](cases/industrial-ring-commissioning/README.md):** configurei switches e validei localmente um anel de redundância industrial, mantendo o aceite de produção e SAT como marcos separados.
- **[Monitoramento de segurança com Wazuh](cases/soc-mvp-architecture/README.md):** implementei a base inicial de telemetria de endpoints, inventário e visibilidade de vulnerabilidades; a operação completa de SOC continua sendo uma frente distinta.
- **[Data center greenfield](cases/vmware-virtual-infrastructure/README.md):** trabalhei na preparação de infraestrutura HPE, VMs, redes VLAN/vSwitch, armazenamento para backup e monitoramento.
- **[Recuperação de servidor HPE](cases/hpe-proliant-post-memory-troubleshooting/README.md):** isolei uma falha de memória durante o POST por meio de testes individuais de DIMMs e substituição por módulos conhecidos como funcionais; restabeleci a inicialização com 64 GB reconhecidos.
- **[Engenharia de monitoramento Zabbix](cases/zabbix-dell-n1124p-on/README.md):** adaptei um template SNMP Dell N-Series ao Zabbix 7 e reduzi de 13 para zero os itens não suportados.
- **[Repositório de atualizações Linux](cases/linux-aptly-update-repository/README.md):** implantei a infraestrutura Aptly/Nginx e validei o consumo de índices de pacotes por um cliente Linux.
- **[Diagnóstico de incidente de rede](cases/industrial-ethernet-crc-troubleshooting/README.md):** investiguei erros de interface, isolei portas e atuei no restabelecimento do enlace.
- **[Infraestrutura física e racks](cases/data-center-rack-infrastructure-planning/README.md):** conduzi levantamentos técnicos, mapeamento, especificação de materiais e planejamento escalonado de reorganização de racks.

## Cases técnicos

Identifico claramente o estágio de cada entrega. Não apresento atividades planejadas como concluídas e diferencio testes de laboratório de validações em produção.

| # | Case | Etapa de entrega | Contribuição técnica |
|---|---|---|---|
| 1 | [VMware → Proxmox migration](cases/proxmox-virtualization-migration/README.md) | Atuação técnica concluída; aceite geral separado | Proxmox cluster, VirtIO/QEMU adaptation, staged workload validation |
| 2 | [TrueNAS/ZFS storage](cases/truenas-zfs-storage/README.md) | Implemented / initial validation | 6×8 TB SAS, JBOD, RAIDZ2, SMART and ZFS validation |
| 3 | [Industrial Ethernet ring commissioning](cases/industrial-ring-commissioning/README.md) | Locally validated | Switch configuration and ring validation; final documentation/SAT pending |
| 4 | [Zabbix 7 template engineering — Dell N1124P-ON](cases/zabbix-dell-n1124p-on/README.md) | Template adaptation and validation | Compatibility fixes, LLD corrections and counter fallback |
| 5 | [Greenfield data center implementation](cases/vmware-virtual-infrastructure/README.md) | Implementation in progress | HPE compute/storage, infrastructure VMs, network, backup and monitoring |
| 6 | [Windows Server 2022 — AD & DNS](cases/windows-server-ad-dns/README.md) | Preparation / homologation | Guest deployment, directory-service preparation and validation plan |
| 7 | [MikroTik corporate network demonstration](cases/mikrotik-corporate-network-lab/README.md) | Hands-on lab | VLANs, routing, firewall, VPN and failover scenarios |
| 8 | [Zabbix & Grafana infrastructure monitoring](cases/zabbix-grafana-infrastructure-monitoring/README.md) | Professional practice | Collection troubleshooting, dashboards and resource analysis |
| 9 | [Layer 2 incident — MAC flapping](cases/layer2-mac-flapping-troubleshooting/README.md) | Incident investigation | Switch logs, fault-domain analysis and redundancy recommendation |
| 10 | [Industrial Ethernet — CRC and recovery](cases/industrial-ethernet-crc-troubleshooting/README.md) | Incident response | Interface analysis, port isolation and communication recovery |
| 11 | [Data center rack reorganization](cases/data-center-rack-infrastructure-planning/README.md) | Project in progress | Technical leadership, field mapping, materials and execution plan |
| 12 | [HPE ProLiant — POST memory failure](cases/hpe-proliant-post-memory-troubleshooting/README.md) | Recovery validated | Individual DIMM tests, known-good substitution and 64 GB restored |
| 13 | [Ubuntu & Aptly update repository](cases/linux-aptly-update-repository/README.md) | Implemented / initial validation | Mirrors, snapshots, HTTP publication and client index refresh |
| 14 | [Wazuh security monitoring baseline](cases/soc-mvp-architecture/README.md) | Initial implementation | Agents, endpoint visibility, inventory and vulnerability monitoring |
| 15 | [Industrial network contingency](cases/industrial-network-contingency-monitoring/README.md) | Preparation / continued monitoring | Reserve ports, persistence checks and activation/rollback runbook |
| 16 | [Fiber and optical troubleshooting](cases/fiber-optical-link-troubleshooting/README.md) | Professional practice | Optics, power interpretation and physical-path diagnosis |
| 17 | [Enterprise infrastructure technical handover — October 2026](cases/enterprise-infrastructure-handover-2026/README.md) | Minha atuação concluída; aceite do cliente separado | Hypervisor migration, server services, endpoint protection, Wazuh/Zabbix and handover checks |

## Áreas de atuação

### Data center e virtualização
Proxmox VE · VMware ESXi/vCenter · KVM/QEMU · VirtIO · Windows Server · Linux · TrueNAS/ZFS · QNAP · backup e recuperação

### Redes e OT
Cisco · MikroTik · Ethernet industrial Siemens · VLANs · STP/LACP · roteamento · VPN · análise CRC/FCS · diagnóstico óptico

### Monitoramento e segurança
Zabbix · Grafana · SNMP/LLD · Wazuh · monitoramento de vulnerabilidades · NetBox · observabilidade

### Serviços de infraestrutura
Active Directory · DNS · WSUS · NTP/Syslog · repositórios Aptly/Nginx · PowerShell · administração Linux

## Como documento minhas entregas

Em cada case, diferencio o contexto, as atividades que executei, os testes realizados, as decisões de implementação, os resultados validados e as pendências. **Não confundo implantação técnica com aceite formal de cliente.** Identifico os laboratórios como tais e não apresento um monitoramento inicial como SOC 24×7.

## Materiais profissionais

- [Experiência técnica para currículo e entrevistas](career/EXPERIENCIA-PROJETOS-2026.md)
- [Estratégia de serviços para a Auron Tech](career/ESTRATEGIA-AURON-SERVICOS.md)
- [Repositório do template Zabbix — Dell N1124P-ON](https://github.com/SamuelGuigo/zabbix-dell-n1124p-on)
- [Relatório técnico de diagnóstico de memória HPE](cases/hpe-proliant-post-memory-troubleshooting/docs/RELATORIO_TECNICO.md)

## Política de publicação

Publico cases técnicos anonimizados, preservando informações confidenciais de clientes e empregadores. Não exponho credenciais, IPs internos, hostnames, topologias sensíveis ou evidências privadas. Consulte [SECURITY.md](SECURITY.md).
