# Wazuh: implantação e validação de recursos

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Plataforma e casos de uso validados em homologação  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Centralizar telemetria e transformar a implantação de agentes em visibilidade verificável sobre os servidores.

Implantei Wazuh, organizei agentes e validei coleta Sysmon, FIM Windows, inventário, hardening e alertas por evento controlado.

## Escopo

Stack single-node em Docker, agentes Windows/Linux e testes de recursos; não inclui operação de SOC 24×7.

## Atividades que executei

- Implantei a plataforma e organizei agentes por função.
- Instalei Sysmon nos Windows do lote e validei coleta e regra personalizada por evento controlado.
- Validei FIM Windows com eventos de criação e alteração em arquivos de teste.
- Verifiquei inventário, SCA e correlação pacote/CVE em Vulnerability Detection.
- Habilitei Archives JSON e validei Filebeat, indexação e consulta.
- Configurei retenção inicial e validei integração automática com Teams por evento controlado.
- Preparei backup local diário de configurações e validei execução/checksum.

## Resultado documentado

14/14 agentes ativos e sincronizados; coleta Sysmon em 11 Windows; FIM added/modified validado em dez servidores Windows; evento controlado indexado e alerta automático recebido no Teams.

## Estado da entrega

- Esses números descrevem checkpoints de homologação, não cobertura ou SLA permanentes.
- FIM Linux e cobertura fora do lote Windows exigiam consolidação adicional.
- Retenção contínua, cópia externa, snapshots de índices e restore funcional permaneciam pendentes.
- Notificação automática no Teams não é bloqueio automático ou Active Response homologado.

## Tecnologias

Wazuh · Docker · Sysmon · FIM · Syscollector · SCA · Vulnerability Detection · Filebeat · Teams

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
