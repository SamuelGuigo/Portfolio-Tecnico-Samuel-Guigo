# Relatório Técnico — Troubleshooting de memória em HPE ProLiant DL380 Gen10 Plus

**Data:** 02/09/2026  
**Escopo:** diagnóstico de falha durante POST e estabilização do subsistema de memória.

## 1. Objetivo

Registrar o processo técnico utilizado para identificar a causa de um servidor HPE ProLiant DL380 Gen10 Plus que não concluía o POST, isolando a falha por meio de evidências do iLO 5, testes individuais de memória e comparação com módulos comprovadamente funcionais.

## 2. Equipamento e ferramentas

- Equipamento: HPE ProLiant DL380 Gen10 Plus
- Gerenciamento: HPE iLO 5
- Logs: Integrated Management Log (IML)
- Inicialização: UEFI / POST
- Memória: ECC RDIMM
- Método: isolamento de variáveis e teste cruzado

Dados específicos do ambiente, cliente, endereços IP, hostnames, números de série e credenciais foram omitidos.

## 3. Situação identificada

Durante uma ronda no ambiente de infraestrutura, o servidor foi observado com as ventoinhas em rotação elevada por tempo prolongado. Como esse comportamento é compatível com etapas de inicialização, foi realizada inspeção no equipamento.

Também foi observado o LED de saúde piscando em vermelho.

Ao acessar a console remota pelo iLO 5, foi identificado que o equipamento não concluía o POST e interrompia a inicialização em:

```text
Memory Initialization - Start
```

O erro apresentado era:

```text
221 - Unknown Initialization Error
The system has experienced a fatal initialization error.
System Halted!
```

## 4. Evidências do iLO / IML

A análise do Integrated Management Log apresentou eventos diretamente relacionados ao subsistema de memória:

```text
462 - Uncorrectable Memory Error Threshold Exceeded
Processor 2, DIMM 14
```

O evento indicava que o DIMM havia sido mapeado para fora e não estava disponível.

Também foi registrado:

```text
223 - DIMM Initialization Error
Processor 2 DIMMs 13, 14
```

O registro indicava falha no treinamento do canal de memória durante o POST.

## 5. Testes executados

### 5.1 Validação da população

Os módulos foram reposicionados de forma controlada para manter a população prevista para o cenário de teste, evitando alterar múltiplas variáveis simultaneamente.

### 5.2 Inversão dos módulos

Os DIMMs foram invertidos entre os processadores mantendo os slots de referência. O objetivo era verificar se a falha acompanharia um módulo específico ou permaneceria associada a um canal/processor.

### 5.3 Teste individual

Cada módulo de 32 GB foi testado individualmente no mesmo slot de referência:

```text
Processor 1 - DIMM 14
```

Os dois módulos reproduziram o erro `221` e impediram a conclusão do POST.

### 5.4 Teste cruzado com memória conhecida como funcional

Para eliminar dúvidas relacionadas a slot, processador, controlador de memória ou system board, foram utilizados dois módulos de 32 GB comprovadamente funcionais provenientes de outro servidor HPE operacional.

Os módulos foram instalados de forma balanceada entre os processadores.

## 6. Resultado do teste cruzado

Com os módulos de referência instalados, o servidor passou pela inicialização de memória e apresentou:

```text
Installed System Memory: 64 GB
Available System Memory: 64 GB
```

Também foi exibido:

```text
HPE Memory authenticated in all populated DIMM slots.
Starting all devices. Please wait...
```

O POST prosseguiu normalmente.

## 7. Estado final

Após a substituição dos módulos que reproduziam a falha pelos módulos validados no teste cruzado:

- o POST foi concluído normalmente;
- os 64 GB instalados foram integralmente reconhecidos;
- a etapa de `Memory Initialization` foi normalizada;
- o equipamento voltou a inicializar normalmente.

## 8. Fluxo de troubleshooting

```text
Ventoinhas em rotação elevada por período anormal
        ↓
Inspeção física / LED de saúde em vermelho
        ↓
Console remota via iLO 5
        ↓
POST interrompido em Memory Initialization
        ↓
221 - Unknown Initialization Error
        ↓
Análise do Integrated Management Log
        ↓
462 / 223 relacionados à memória
        ↓
Inversão e testes individuais dos DIMMs
        ↓
Falha reproduzida
        ↓
Teste cruzado com DIMMs conhecidos como funcionais
        ↓
64 GB reconhecidos / POST concluído
        ↓
Servidor normalizado
```

## 9. Observações de publicação

Este documento foi preparado para portfólio técnico. Informações que poderiam identificar cliente, ambiente ou infraestrutura foram removidas. Evidências visuais devem ser sanitizadas antes de serem adicionadas ao repositório.
