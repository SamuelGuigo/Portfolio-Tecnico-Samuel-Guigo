# Storage TrueNAS com ZFS RAIDZ2

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Implantado e validado para uso inicial  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Disponibilizar storage para virtualização com redundância ZFS e visibilidade individual dos discos.

Implantei TrueNAS com discos em JBOD, criei o pool RAIDZ2 e validei integridade ZFS e saúde básica dos discos.

## Escopo

Seis HDDs SAS de 8 TB apresentados em JBOD, pool RAIDZ2 e integração inicial ao ambiente de virtualização.

## Atividades que executei

- Preparei o TrueNAS e a apresentação individual dos discos.
- Criei o pool ZFS RAIDZ2.
- Verifiquei estado do pool, contadores READ/WRITE/CKSUM e SMART básico.
- Validei conectividade e disponibilidade do storage para a migração.

## Resultado documentado

Pool ONLINE, aproximadamente 28,94 TiB úteis, sem erros de leitura/escrita/checksum registrados e saúde básica OK nos seis discos no checkpoint documentado.

## Estado da entrega

- SMART Long e scrub completos permaneciam pendentes para uma janela apropriada.
- O resultado de saúde inicial não comprova backup/restauração ou disponibilidade sustentada em produção.

## Tecnologias

TrueNAS · ZFS · RAIDZ2 · SAS · JBOD · SMART

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
