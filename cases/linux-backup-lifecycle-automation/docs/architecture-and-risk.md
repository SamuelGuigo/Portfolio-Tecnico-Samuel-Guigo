# Arquitetura e avaliação de riscos / Architecture and risk review

[← Case principal](../README.md)

## Arquitetura conceitual (genérica)

```text
Gerador de dump SQL
      |
      v
Filesystem local (backups recentes)
      |
      v
systemd timer -> oneshot migration
      |  checagens de idade, montagem e capacidade
      |  bloqueio de concorrência; uso aparente do arquivo
      |  cópia temporária; comparação byte a byte
      |  publicação do destino; remoção final da origem
      v
Volume de arquivo histórico (backups antigos)
```

O fluxo acima descreve controles gerais documentados na atividade. **Não** reproduz a configuração nem o código do ambiente profissional.

## Matriz de riscos

| Risco | Controles esperados | Limitações |
|---|---|---|
| Volume errado/desmontado | Conferir `findmnt`, tipo e espaço | Montagens podem mudar entre verificações |
| Dump incompleto | Janela mínima de idade, retenção de recentes e metadados estáveis | Produtor pode reabrir dumps antigos |
| Arquivo em uso | Verificações com `fuser` e bloqueio em caso de erro | Checagem pontual não elimina corridas |
| Execuções concorrentes | Lock de instância | Outros processos exigem coordenação separada |
| Cópia parcial/corrupta | Arquivo temporário e comparação `cmp` | Não substitui verificação de restore |
| Nome já existente | Bloquear sobrescrita e registrar incidente | Requer tratamento operacional |
| Volume destino cheio | Reserva mínima e limiar de ocupação | Necessária política de crescimento/retenção |
| I/O e memória | Horário adequado, prioridade conservadora e monitoramento | Não garante ausência de impacto em produção |
| Perda de dados | Remover origem somente após confirmar arquivo completo no destino | Exige recuperação e backups independentes quando aplicável |

## Pré-requisitos de mudança

1. Confirmar proprietário dos dados, retenção aprovada, escopo e autorização.
2. Validar o horário e a forma como os dumps são gerados e finalizados.
3. Medir capacidade e saúde da raiz e do volume separado.
4. Preparar rollback; evitar ações irreversíveis se não houver recuperação válida.
5. Testar em arquivos sintéticos e verificar log e critérios de elegibilidade.
6. Executar primeiro ciclo sob acompanhamento; medir tempo, I/O e memória.
7. Comparar resultado no filesystem e avaliar um teste de restauração.
8. Monitorar saturação futura de ambos os volumes.

A limpeza manual de backups históricos é **outra operação**, sujeita a autorização e critérios de retenção. O timer de migração não a executa.

O script publicado em [examples/retention-preview.sh](../examples/retention-preview.sh) é apenas uma prévia de elegibilidade, nunca remove/move arquivos e não implementa esse pipeline completo.
