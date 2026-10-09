# Implantação de infraestrutura corporativa — VMware ESXi, serviços e migração para Proxmox

[← Portfólio técnico](../../README.md)

**Atuação:** implantação, configuração, migração, troubleshooting e documentação de infraestrutura corporativa  
**Período documentado:** setembro–outubro de 2026  
**Conclusão:** frente técnica atribuída encerrada em 09/10/2026; aceite geral da implantação é separado

## Resumo

Atuei na implementação de uma infraestrutura corporativa de servidores e serviços, inicialmente sobre **VMware ESXi integrado ao vCenter**. Preparei o hypervisor, criei e configurei máquinas virtuais Windows Server e Ubuntu, apoiei a implantação de serviços de infraestrutura e trabalhei nas dependências de rede, armazenamento, segurança e backup. Posteriormente, uma mudança de plataforma exigiu **migrar as cargas de trabalho para Proxmox VE**, adaptar os guests e verificar novamente seus serviços.

O principal aprendizado demonstrado é a capacidade de executar **duas etapas substanciais de plataforma**: primeiro construir o ambiente virtual VMware e depois conduzir a transição para Proxmox — não apenas transportar VMs preexistentes.

## Linha do tempo da atuação

### 1. Construção inicial — VMware ESXi e vCenter

- Preparei o ambiente VMware ESXi e sua integração ao vCenter.
- Trabalhei no provisionamento, dimensionamento e configuração de VMs Windows e Linux.
- Configurei a integração dos sistemas convidados, atualizações e bases de serviços.
- Considerei vSwitches/port groups, redes segmentadas e dependências de endereçamento.
- Estruturei o planejamento de datastore, backup e recuperação.

### 2. Configuração das VMs e dos serviços

| Frente | Trabalho documentado | Limite da afirmação |
|---|---|---|
| Active Directory e DNS | Duas VMs Windows Server 2022 destinadas a controladores de domínio e DNS; preparação/configuração e testes | Aceite integral de autenticação, redundância, backup e DNS deve ser separado |
| WSUS | Servidor Windows de atualizações, incluindo conversão de edição Windows e etapas de sincronização/configuração | Políticas GPO, grupos, cliente piloto e conformidade do parque exigem homologação própria |
| RLSUS / Aptly | Ubuntu Server, mirrors, snapshots, repositórios TEST/PROD e publicação HTTP; validação real de atualização em cliente Linux | Não é prova de atualização de todos os sistemas |
| NTP e Syslog | VM Ubuntu preparada e verificações de serviços e conectividade | Retenção, integração de todas as fontes e aceite final não presumidos |
| Backup | VM Windows destinada ao Iperius Full, arquitetura com repositório de backup separado | Integração final ao NAS, jobs e testes de restauração não são alegados como concluídos |
| SQL / MES | Preparação de VM destinada a aplicação MES e SQL Server | Instalação do SQL e homologação de aplicação atribuídas a outra frente; não reivindico essa entrega |
| Proteção de endpoint | SEPM e implantação de cliente SEP; investigação de falha de login relacionada a certificado/nome do servidor | Centralização, comunicação de todos os agentes e políticas requerem evidência específica |
| Armazenamento | Trabalho com desenho e preparação de TrueNAS/ZFS e integração prevista com backup/QNAP | Não declaro teste de restauração de ponta a ponta sem evidência |

### 3. Transição VMware → Proxmox

- Preparei o ambiente Proxmox VE e a operação do cluster.
- Migrei workloads existentes do VMware para o novo hypervisor.
- Ajustei controladoras, interfaces virtuais e drivers **VirtIO** conforme o guest.
- Trabalhei com integração **QEMU Guest Agent** e validações de inicialização, rede e serviços.
- Tratei efeitos da mudança de hardware virtual no licenciamento/ativação Windows.
- Verifiquei a continuidade funcional dos sistemas migrados na etapa técnica.

**Resultado:** frente de migração e validação técnica de infraestrutura reportada concluída em outubro de 2026. Não equivale a aceite final de todas as aplicações ou recuperação de desastres comprovada.

### 4. Monitoramento, segurança e fechamento

- Participei da implantação e configuração do Wazuh em ambiente Docker integrado ao contexto de monitoramento.
- O diário técnico registrou **14 de 14 agentes Wazuh ativos** em um marco do rollout; não significa que todos os controles de SOC foram concluídos.
- Trabalhei no acesso ao dashboard, visibilidade de inventário e vulnerabilidades e planejamento de demonstração técnica.
- Atuei com Zabbix, grupos de hosts, agentes e restabelecimento de acesso ao dashboard.
- Trabalhei no SEPM, diagnóstico de certificado incompatível com hostname alterado e implantação de proteção nos servidores.
- Preparei handover com pendências e critérios de validação restantes.

## Resultados profissionais comprováveis

- Experiência prática nas **duas plataformas**: implantação inicial VMware ESXi e posterior migração para Proxmox.
- Provisionamento e configuração de VMs corporativas Windows/Linux e serviços essenciais.
- Implantação funcional de repositório interno de atualizações Linux, com consumo e atualizações verificadas em cliente piloto.
- Verificações de agentes, monitoramento e segurança em múltiplas cargas.
- Troubleshooting de hypervisor, convidados, integrações, ativação e gerenciamento de endpoint.
- Documentação de limites de entrega, riscos operacionais e dependências entre equipes.

## O que não reivindico

- Ter implantado o SQL da aplicação sob responsabilidade de outra equipe.
- Homologação de produção, SLA 24×7, SOC operacional completo ou certificação de conformidade.
- Backup e restauração integralmente testados sem evidências.
- Conclusão automática de todas as pendências de storage, rede e aceite do cliente.

## Tecnologias

VMware ESXi · vCenter · Proxmox VE · KVM/QEMU · VirtIO · Windows Server 2022 · Active Directory · DNS · WSUS · Ubuntu · Aptly · Nginx · NTP · Syslog · Iperius · TrueNAS · QNAP · Wazuh · Zabbix · Symantec Endpoint Protection · Siemens Industrial Ethernet

## Confidencialidade

Este case é intencionalmente anônimo. Registros técnicos completos, identificadores do cliente, IPs, hostnames, licenças, diagramas reais, configurações e imagens permanecem em documentação privada autorizada. O trabalho ocorreu no contexto de empregador/cliente, não como um contrato realizado pela Auron Tech.
