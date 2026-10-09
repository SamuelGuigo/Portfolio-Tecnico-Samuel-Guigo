# Implantação de infraestrutura: VMware, serviços e migração para Proxmox

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Frente técnica concluída; aceite integrado pendente  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Construir uma infraestrutura de servidores para um ambiente corporativo e industrial e adaptar as cargas a uma mudança de hypervisor durante o projeto.

Implantei a plataforma VMware, provisionei VMs Windows/Linux e depois migrei o ambiente para Proxmox, com serviços, rede, storage, monitoramento e segurança.

## Escopo

Preparação e homologação de infraestrutura, de setembro a outubro de 2026. O case reúne as etapas do mesmo projeto; os recortes abaixo detalham cada frente.

## Atividades que executei

- Preparei o VMware ESXi e trabalhei na integração ao vCenter, no dimensionamento, na criação das VMs e na configuração de redes virtuais.
- Configurei sistemas Windows Server e Ubuntu e serviços de AD/DNS, atualizações, monitoramento e proteção de endpoints dentro da minha frente.
- Preparei o Proxmox, criei o cluster usado na transição e migrei as VMs, ajustando VirtIO, QEMU Guest Agent, boot, rede e ativação Windows.
- Implantei TrueNAS/ZFS e validei o pool e a saúde básica dos discos para uso inicial.
- Atuei no switching Siemens, VLANs, conectividade e correção de rotas; restabeleci comunicação após alteração de tags nas interfaces virtuais.
- Implantei e validei recursos do Wazuh, atuei no Zabbix e distribuí o SEP remotamente aos servidores Windows.
- Documentei as validações, dependências entre equipes e pendências para o fechamento técnico.

## Resultado documentado

Migração estabilizada no host definitivo; AD/DNS com replicação validada; repositório Linux consumido por piloto com nove atualizações aplicadas; 14/14 agentes Wazuh ativos e sincronizados; 10/10 endpoints Windows Online e Up-to-date no SEPM, no checkpoint de 09/10/2026.

## Estado da entrega

- Minha frente técnica foi reportada concluída em 09/10/2026, em ambiente de preparação/homologação. SAT, as-built e aceite de produção permaneciam como marcos do projeto.
- A configuração do QNAP foi realizada por outro integrante da equipe. Integração Iperius, retenção e restauração funcional permaneciam pendentes.
- Entreguei a camada de infraestrutura das VMs de aplicação. Instalação e homologação de SQL/MES pertenciam à equipe responsável pela aplicação.
- SEP Linux, certificado definitivo do SEPM, acesso remoto definitivo e testes completos de recuperação permaneciam pendentes.

## Tecnologias

VMware ESXi · vCenter · Proxmox VE · VirtIO · Windows Server 2022 · Ubuntu · AD/DNS · WSUS · Aptly · TrueNAS/ZFS · Siemens · Wazuh · Zabbix · SEP/SEPM

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
