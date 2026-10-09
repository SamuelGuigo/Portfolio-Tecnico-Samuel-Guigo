# Template Zabbix 7 para Dell N1124P-ON

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto publicado  
**Estado documentado:** Adaptado e validado no modelo documentado  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Estabilizar um template legado que apresentava incompatibilidade de schema, No Such Instance e colisões de keys.

Adaptei um template comunitário Dell N-Series para Zabbix 7 e corrigi importação, LLD, contadores e telemetria incompatível.

## Escopo

Compatibilidade Zabbix 7, disponibilidade, CPU/memória, interfaces e sensores no Dell N1124P-ON documentado.

## Atividades que executei

- Ajustei schema e dependências ICMP para Zabbix 7.
- Criei fallback IF-MIB de 32 bits para VLANs sem contadores HC e mantive 64 bits nas interfaces físicas.
- Desativei Process Discovery dependente de índices voláteis.
- Removi prototypes legados Fan/PSU incompatíveis.
- Corrigi keys de TempUnit LLD com SNMPINDEX e atualizei referências.
- Publiquei YAML, changelog e documentação das limitações.

## Resultado documentado

Template importável e estabilizado para o equipamento validado. O registro do portfólio documenta redução de 13 para zero itens não suportados após as correções e retirada de coletas incompatíveis.

## Estado da entrega

- O resultado inclui desativação/remoção de telemetria incompatível; não significa implementação de todos os OIDs.
- PoE e validação em outros modelos/firmwares permanecem no roadmap.
- A autoria da base comunitária é preservada; minha contribuição é a adaptação, troubleshooting e validação.

## Tecnologias

Zabbix 7 · SNMP · LLD · IF-MIB · Dell N-Series

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).

## Código e documentação

[Repositório do template Dell/Zabbix](https://github.com/SamuelGuigo/zabbix-dell-n1124p-on)
