# Validação operacional e rollback / Validation & rollback

[← Case principal](../README.md)

## Antes da execução

- [ ] Confirmar aprovação da mudança e política de recuperação/retention.
- [ ] Confirmar montagem, dispositivo, filesystem e espaço mínimo do destino.
- [ ] Verificar criação e fechamento dos dumps SQL; evitar coincidência com job de backup.
- [ ] Conferir período mínimo de idade e quantidade de cópias recentes preservadas.
- [ ] Testar sintaxe, ambiente isolado, limites de ocupação, lock e tratamento de falhas.
- [ ] Preparar monitoração de I/O/memória e plano de parada.

## Após a execução

- [ ] Conferir `systemd` journal, hora de início/fim e status do serviço.
- [ ] Conferir arquivo no destino e seu tamanho; validar comparação de integridade.
- [ ] Confirmar ausência da origem somente se o destino estiver íntegro.
- [ ] Verificar que os backups recentes permaneceram.
- [ ] Medir uso dos volumes e investigar alertas.
- [ ] Confirmar próxima ativação do timer.
- [ ] Planejar teste de restauração em ambiente autorizado.

### Exemplos genéricos de consultas somente leitura

Substitua nomes e diretórios fictícios conforme documentação do ambiente **autorizado**:

```bash
findmnt --mountpoint /example/archive
df -h /example/source /example/archive
systemctl list-timers --all
journalctl -u example-backup-migration.service --since 'today 03:30' --no-pager
```

## Se houver falha

- Interromper **próximos disparos** desabilitando o timer mediante controle de mudanças. Desabilitar o timer **não encerra** um serviço já em execução.
- Preservar originais e arquivos temporários até avaliar integridade e possibilidade de recuperação.
- Não sobrescrever nem excluir arquivos em tentativa de correção improvisada.
- Conferir logs, montagem, capacidade, processo gerador, permissões e disponibilidade.
- Restaurar o procedimento anterior somente após aprovação e verificação do efeito da reversão.

## Evidências deste case

Foram registrados, em documentação privada, a migração manual de cinco arquivos com comparação aprovada, uma limpeza histórica pontual de 29 backups, a primeira execução agendada com sucesso, validação de presença/ausência do dump e confirmação da próxima janela.

**Não foram comprovados neste case:** teste de restauração SQL, aceite de retenção automática no histórico e resolução final do alerta Zabbix.
