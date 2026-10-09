# Repositório Linux com Aptly e Nginx

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Repositório e atualização piloto validados  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Centralizar a distribuição de pacotes Ubuntu e controlar quais versões ficam disponíveis aos servidores.

Implantei um repositório Ubuntu com mirrors, snapshots e canais TEST/PROD e validei seu consumo em um cliente piloto.

## Escopo

Ubuntu 24.04/Noble, arquitetura amd64, Aptly, Nginx, GPG e publicação interna de pacotes.

## Atividades que executei

- Preparei Ubuntu Server e o serviço Aptly.
- Configurei mirrors Noble/Noble Updates e snapshots.
- Publiquei canais TEST/PROD com Nginx e trabalhei na assinatura GPG.
- Validei índices APT e a aplicação de atualizações no piloto.
- Documentei sincronização, retenção e proteção de chaves/configuração.

## Resultado documentado

Repositório consumido pelo cliente piloto, com nove atualizações reais aplicadas no ciclo documentado.

## Estado da entrega

- O piloto não comprova atualização de todo o parque.
- Política definitiva de sincronização, retenção/runbook e backup de chaves/configuração permaneciam pendentes.

## Tecnologias

Ubuntu 24.04 · Aptly · APT · Nginx · GPG · Snapshots

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
