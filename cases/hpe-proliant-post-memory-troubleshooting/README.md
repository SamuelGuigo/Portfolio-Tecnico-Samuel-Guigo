# Recuperação de servidor HPE com falha no POST

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Troubleshooting  
**Estado documentado:** Inicialização recuperada com 64 GB reconhecidos  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Servidor HPE parava durante Memory Initialization, com alertas de saúde e eventos de memória no IML.

Diagnostiquei falha de inicialização de memória, testei DIMMs individualmente e recuperei o POST com módulos conhecidos como funcionais.

## Escopo

HPE ProLiant DL380 Gen10 Plus, iLO 5, IML e testes controlados de ECC RDIMM.

## Atividades que executei

- Consultei console remoto e logs IML.
- Reposicionei módulos e revisei população de memória.
- Testei individualmente os DIMMs originais na mesma posição de referência.
- Realizei teste cruzado com dois módulos de 32 GB conhecidos como funcionais.
- Verifiquei conclusão do POST e memória instalada/disponível.

## Resultado documentado

Os módulos originais reproduziram o erro 221 nos testes individuais; com a substituição, o servidor completou POST e reconheceu 64 GB instalados e disponíveis.

## Estado da entrega

- O resultado é específico à configuração testada; não representa teste exaustivo de todos os slots.

## Tecnologias

HPE ProLiant · iLO 5 · IML · POST · ECC RDIMM

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).

## Documentação

[Relatório técnico de diagnóstico](docs/RELATORIO_TECNICO.md)
