# SEP/SEPM: implantação remota de proteção Windows

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Rollout Windows validado; ajustes de fechamento pendentes  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Distribuir proteção gerenciada sem instalar manualmente em cada VM e tratar uma divergência entre nome do servidor e certificado.

Preparei o SEPM, recuperei acesso ao console e distribuí o cliente SEP remotamente, validando endpoints e Manager.

## Escopo

SEPM com SQL Express local, backup do banco, pacote gerenciado Windows e Remote Push para dez servidores.

## Atividades que executei

- Verifiquei serviços do SEPM e SQL Express.
- Diagnostiquei a divergência de identidade/certificado e recuperei acesso com uma identidade compatível temporária.
- Executei backup do banco antes do rollout.
- Exportei o pacote gerenciado Windows e iniciei implantação remota em lote.
- Validei serviço, registro no Manager e atualização de definições após a instalação.

## Resultado documentado

10/10 endpoints registrados e Online, serviço SepMasterService Running/Automatic e dashboard com dez Up-to-date e zero Offline no checkpoint final de 09/10/2026.

## Estado da entrega

- O relatório de início da madrugada registrava instalação em andamento; o consolidado posterior registra o rollout Windows concluído.
- Um estado Disabled e duas solicitações de restart ainda exigiam revisão.
- Certificado/identidade definitiva e rollout Linux permaneciam pendentes. Não exponho a identidade temporária nem detalhes do ambiente.

## Tecnologias

Symantec SEP · SEPM · SQL Express · Remote Push · PowerShell · Windows Server

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
