# Migração VMware → Proxmox VE

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Migração concluída e validada na frente técnica  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Mudar o hypervisor de uma infraestrutura já implantada, preservando a operação dos serviços e uma sequência controlada de validação.

Migrei VMs Windows/Linux do VMware para Proxmox e validei boot, rede, serviços e integração dos convidados.

## Escopo

Instalação de hosts, cluster de transição, movimentação das VMs e adaptação dos sistemas convidados. O cluster facilitou a migração; não é apresentado como HA de produção homologado.

## Atividades que executei

- Preparei o Proxmox definitivo e o cluster utilizado na transição.
- Migrei as cargas por etapas, revisando BIOS/UEFI, recursos, discos, bridges e VLANs.
- Instalei e validei VirtIO e QEMU Guest Agent nos Windows aplicáveis.
- Regularizei a ativação Windows após a mudança do hardware virtual.
- Verifiquei inicialização, conectividade, storage e serviços após cada movimentação.

## Resultado documentado

VMs migradas e estabilizadas no host definitivo em outubro de 2026; o equipamento temporário foi liberado para sua função de observabilidade.

## Estado da entrega

- Aceite das aplicações, backup/restauração e retirada do acesso transitório são etapas próprias.
- A migração e a implantação VMware original fazem parte do mesmo projeto descrito no case consolidado.

## Tecnologias

VMware ESXi · Proxmox VE · KVM/QEMU · VirtIO · QEMU Guest Agent · Windows Server · Linux

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).

## Projeto relacionado

[Implantação completa e transição de plataforma](../enterprise-infrastructure-handover-2026/README.md)
