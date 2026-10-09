# Active Directory e DNS redundante

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Projeto profissional  
**Estado documentado:** Serviços e replicação validados em homologação  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

Disponibilizar identidade e resolução de nomes para os servidores do ambiente.

Preparei VMs Windows Server, configurei AD/DNS e validei replicação e resolução de nomes.

## Escopo

Dois controladores de domínio/DNS, configuração dos clientes e validações de saúde do diretório.

## Atividades que executei

- Preparei Windows Server e a integração com o hypervisor.
- Configurei a base AD DS/DNS e o DNS dos servidores.
- Validei replicação nos dois sentidos com repadmin.
- Executei verificações DNS com dcdiag e trabalhei nos registros reversos/PTR.
- Organizei dependências de rede, tempo, políticas e documentação.

## Resultado documentado

AD/DNS operacional, replicação bidirecional sem erros na execução registrada de repadmin e teste DNS do domínio aprovado no checkpoint de homologação.

## Estado da entrega

- Revisão de registros residuais e documentação final de FSMO, Sites/Subnets e GPOs permaneciam como acabamentos.
- Recuperação de domínio e aceite de produção não são inferidos dos testes de replicação.

## Tecnologias

Windows Server 2022 · AD DS · DNS · GPO · repadmin · dcdiag

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
