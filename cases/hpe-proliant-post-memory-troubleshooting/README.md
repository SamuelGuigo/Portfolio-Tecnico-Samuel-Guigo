# HPE ProLiant DL380 Gen10 Plus — Troubleshooting de falha de memória no POST

Case técnico de diagnóstico e correção de falha de hardware em servidor **HPE ProLiant DL380 Gen10 Plus**, utilizando **HPE iLO 5**, **Integrated Management Log (IML)**, testes individuais de DIMM e teste cruzado com memória conhecida como funcional.

> **Segurança:** este case não contém endereços IP, hostnames, credenciais, números de série, nomes de clientes ou outros identificadores do ambiente onde o troubleshooting foi executado.

## Equipamento validado

| Item | Valor |
|---|---|
| Fabricante | Hewlett Packard Enterprise |
| Modelo | HPE ProLiant DL380 Gen10 Plus |
| Gerenciamento | HPE iLO 5 |
| Firmware observado | System ROM U46 v1.72 |
| Memória validada ao final | 64 GB |
| Tecnologia | ECC RDIMM |
| Método | Troubleshooting físico + iLO/IML |

## Situação identificada

Durante uma ronda no ambiente de infraestrutura, foi observado que o servidor permanecia com as **ventoinhas em rotação elevada por um período anormal**.

Como esse comportamento é típico durante etapas de POST, foi realizada uma inspeção no equipamento. Também foi identificado o **LED de saúde piscando em vermelho**.

Ao acessar a console remota via iLO 5, foi constatado que o equipamento **não concluía o POST** e interrompia a inicialização em:

```text
Memory Initialization - Start
```

O erro apresentado era:

```text
221 - Unknown Initialization Error
The system has experienced a fatal initialization error.
System Halted!
```

## Evidências identificadas

No **Integrated Management Log (IML)** foram registrados eventos diretamente relacionados ao subsistema de memória:

```text
462 - Uncorrectable Memory Error Threshold Exceeded
Processor 2, DIMM 14
```

```text
223 - DIMM Initialization Error
Processor 2 DIMMs 13, 14
The identified memory channel could not be properly trained and has been mapped out.
```

Os registros direcionaram o troubleshooting para os módulos DIMM e para o processo de treinamento da memória durante o POST.

## Testes executados

### 1. Validação física e de população

Os módulos foram reencaixados e posicionados de forma controlada, evitando alterações simultâneas de múltiplas variáveis.

### 2. Inversão dos DIMMs

Os módulos foram invertidos entre os processadores mantendo os slots de referência, com o objetivo de observar se a falha acompanharia o módulo ou permaneceria associada ao caminho de memória.

### 3. Testes individuais

Cada módulo de **32 GB** foi testado individualmente no mesmo slot de referência:

```text
Processor 1 - DIMM 14
```

Os dois módulos reproduziram o erro `221` e impediram a conclusão do POST.

### 4. Teste cruzado

Foram utilizados **2 módulos de 32 GB comprovadamente funcionais** provenientes de outro servidor HPE operacional.

Com esses módulos instalados, o servidor apresentou:

```text
Installed System Memory: 64 GB
Available System Memory: 64 GB
```

Também foi exibido:

```text
HPE Memory authenticated in all populated DIMM slots.
Starting all devices. Please wait...
```

O equipamento passou normalmente pela etapa de inicialização de memória e prosseguiu com o POST.

## Resultado

Após a substituição dos módulos que reproduziam a falha pelos DIMMs validados durante o teste cruzado:

- [x] POST concluído normalmente
- [x] 64 GB de memória reconhecidos
- [x] 64 GB de memória disponíveis
- [x] `Memory Initialization` normalizada
- [x] servidor novamente operacional

## Fluxo de troubleshooting

```text
Ventoinhas em rotação elevada
        ↓
Inspeção física / LED de saúde em vermelho
        ↓
Console remota via iLO 5
        ↓
POST interrompido em Memory Initialization
        ↓
221 - Unknown Initialization Error
        ↓
Análise do IML
        ↓
462 / 223 relacionados à memória
        ↓
Testes individuais e inversão dos DIMMs
        ↓
Falha reproduzida
        ↓
Teste cruzado com DIMMs conhecidos como funcionais
        ↓
64 GB reconhecidos / POST concluído
        ↓
Servidor normalizado
```

## Tecnologias utilizadas

- HPE ProLiant DL380 Gen10 Plus
- HPE iLO 5
- Integrated Management Log (IML)
- UEFI / POST
- ECC RDIMM
- Troubleshooting de hardware
- Isolamento de variáveis

## Documentação

- [Relatório técnico](docs/RELATORIO_TECNICO.md)
- [Changelog](CHANGELOG.md)
- [Security](SECURITY.md)

## Estrutura do projeto

```text
.
├── README.md
├── CHANGELOG.md
├── SECURITY.md
└── docs/
    └── RELATORIO_TECNICO.md
```

## Status

- [x] Sintoma identificado em campo
- [x] POST analisado via console remota
- [x] Eventos de memória confirmados no IML
- [x] DIMMs testados individualmente
- [x] Teste cruzado realizado
- [x] POST normalizado
- [x] Documentação sanitizada para portfólio
- [ ] Adicionar galeria de evidências sanitizadas
