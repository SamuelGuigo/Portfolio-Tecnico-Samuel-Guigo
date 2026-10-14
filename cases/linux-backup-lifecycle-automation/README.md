# Automação do ciclo de vida de backups SQL em Linux

[← Portfólio técnico](../../README.md) · [English version](README.en.md)

**Autor:** Samuel Guigo  
**Tipo:** Troubleshooting, storage e automação operacional  
**Estado:** Primeira migração automática homologada; validações complementares pendentes  
**Origem:** Atuação profissional em equipe, em contratação distinta da Auron Tech.

## Contexto e problema

Atendi um alerta de armazenamento em um servidor Linux utilizado por serviços de monitoramento. Dumps SQL periódicos do Zabbix estavam acumulados no filesystem do sistema operacional. A transferência dos backups antigos para um volume de histórico era manual, permitindo que a partição raiz voltasse a se aproximar do limite.

O objetivo foi recuperar capacidade, preservar a integridade dos backups e tornar a migração dos arquivos antigos repetível, sem alterar a geração dos dumps nem reiniciar o serviço de monitoramento.

## O que executei

- Analisei partições, montagens e diretórios com `df`, `lsblk`, `findmnt`, `du` e `find` para identificar a origem do consumo.
- Transferi manualmente cinco dumps SQL para um volume distinto; comparei origem e destino byte a byte antes de remover os originais individualmente.
- Refinei a rotina Bash com seleção por idade, preservação dos dois backups mais recentes na origem, checagem de montagem/capacidade, proteção de execução concorrente e validação de cópia.
- Configurei um serviço `systemd` do tipo oneshot e timer diário em horário de menor atividade.
- Executei **limpeza histórica pontual e manual**, com corte autorizado e confirmação individual de 29 arquivos antigos no volume de histórico. Essa exclusão **não faz parte da rotina automática**.
- Validei a primeira execução agendada pelo journal do systemd e conferi a ausência do arquivo de origem, sua presença no destino, o tamanho esperado, a ocupação dos volumes e o próximo timer.

## Resultados comprovados

| Indicador | Evidência |
|---|---|
| Partição do sistema | De **89%** para **29%** após a migração inicial |
| Migração inicial | **5 backups** com comparação byte a byte aprovada |
| Limpeza de arquivo histórico | **29 backups** antigos excluídos em atividade separada |
| Capacidade liberada no arquivo histórico | Aproximadamente **233 GB**, segundo medição do filesystem |
| Ocupação do volume histórico | De **76%** para **35%** após a limpeza; **36%** após a primeira execução automática |
| Primeira execução automatizada | **1 dump** transferido e validado; serviço encerrado com sucesso |
| Continuidade da rotina | Próximo disparo diário confirmado no `systemd` |

O teste de integridade realizado comprova **igualdade byte a byte na transferência**. Não comprova consistência lógica do banco nem sucesso em uma eventual restauração SQL.

## Desenho operacional

1. Conferir montagem, capacidade e espaço reservado no destino.
2. Preservar os dois arquivos mais recentes e selecionar somente dumps antigos/elegíveis.
3. Verificar uso aparente e estabilidade dos arquivos; bloquear em caso de erro ou colisão.
4. Transferir para nome temporário, comparar conteúdo e publicar o destino definitivo.
5. Somente após validações, remover a origem; registrar logs e acompanhar capacidade dos dois volumes.
6. Manter arquivamento histórico e **exclusão histórica** como políticas separadas.

Verificações pontuais com `fuser` não eliminam completamente condições de corrida. A rotina geradora precisa entregar arquivos finalizados e não reescrever dumps antigos. Consulte a [análise de riscos](docs/architecture-and-risk.md).

## Tecnologias

Debian Linux · Bash · XFS · Zabbix · systemd Timers · `findmnt` · `fuser` · `cmp` · `flock` · troubleshooting · backup lifecycle · change management.

## Pendências e limites de aceite

- Teste de restauração do banco de dados não executado neste recorte.
- Pico de memória observado no processo automático merece acompanhamento junto às métricas de I/O.
- Normalização do alerta original no sistema de monitoramento ainda sem evidência independente.
- Retenção automática definitiva dos arquivos **já arquivados** não foi implantada.

## Conteúdo público

- [English case study](README.en.md)
- [Arquitetura e riscos](docs/architecture-and-risk.md)
- [Validação e rollback](docs/validation-and-rollback.md)
- [Exemplo ilustrativo de seleção de backups](examples/retention-preview.sh)
- [Teste com arquivos sintéticos](examples/test-preview.sh)

Para executar o **teste do exemplo**, sem movimentar nem excluir backups:

```bash
bash examples/test-preview.sh
```

O exemplo é **somente leitura** e foi escrito independentemente para demonstrar regras de elegibilidade. **Não é o script utilizado em produção, não migra nem exclui arquivos e não deve ser tratado como automação pronta para implantar.**

## Confidencialidade e atribuição

Case técnico anonimizado de atividade profissional em equipe, **não uma entrega comercial da Auron Tech**. Foram omitidos cliente, localidade, hostnames, IPs, caminhos internos, prints, logs privados, parâmetros específicos e código operacional da empresa. Consulte a [política de publicação](../../SECURITY.md).
