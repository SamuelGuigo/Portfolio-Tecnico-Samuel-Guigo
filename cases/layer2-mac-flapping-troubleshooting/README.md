# Investigação de indisponibilidade e MAC flapping

[← Portfólio técnico](../../README.md)

**Autor:** Samuel Guigo  
**Tipo:** Troubleshooting  
**Estado documentado:** Diagnóstico de camada 2 e recomendação entregues  
**Origem:** Experiência profissional em equipe; contratação distinta da Auron Tech.

## Contexto e problema

VMs, interfaces de gerenciamento e monitoramento ficaram indisponíveis simultaneamente.

Correlacionei indisponibilidade de recursos virtualizados com logs de MAC flapping e revisei os caminhos redundantes.

## Escopo

Logs de switching, aprendizado MAC, análise de STP e avaliação de agregação compatível.

## Atividades que executei

- Acessei o switch próximo ao ambiente virtualizado e coletei logs.
- Correlacionei movimentação repetida de MACs com a interrupção.
- Revisei caminhos redundantes e premissas de STP/agregação.
- Recomendei revisão da topologia e avaliação de LACP/Port-Channel quando compatível.

## Resultado documentado

Delimitei a investigação na dependência compartilhada de camada 2 e entreguei uma direção técnica de correção da redundância.

## Estado da entrega

- MAC flapping isoladamente não prova loop.
- Não há implantação LACP concluída ou redução medida de indisponibilidade registrada neste case.

## Tecnologias

Cisco · Switching · STP · MAC learning · LACP

## Confidencialidade

Informações de clientes, localidades, endereços, hostnames, números de série, credenciais, configurações reais e imagens privadas foram omitidas. As evidências completas permanecem em documentação privada. Consulte a [política de publicação](../../SECURITY.md).
