# Case técnico — HPE ProLiant não concluindo o POST

## Resumo

Durante uma ronda no ambiente de infraestrutura, foi observado um servidor **HPE ProLiant DL380 Gen10 Plus** com as ventoinhas operando em rotação elevada por um período incomum. Como esse comportamento é típico durante etapas de inicialização, foi realizada uma inspeção no equipamento, onde também foi identificado o **LED de saúde piscando em vermelho**.

A partir desse ponto foi iniciado o troubleshooting do servidor.

## Ocorrência

Por meio do **HPE iLO 5** e da console remota, foi constatado que o servidor **não concluía o POST** e interrompia a inicialização durante a etapa:

```text
Memory Initialization - Start
```

O POST apresentava o erro:

```text
221 - Unknown Initialization Error
The system has experienced a fatal initialization error.
System Halted!
```

## Evidências no iLO

A análise do **Integrated Management Log (IML)** apresentou eventos relacionados ao subsistema de memória:

```text
462 - Uncorrectable Memory Error Threshold Exceeded
Processor 2, DIMM 14
```

```text
223 - DIMM Initialization Error
Processor 2 DIMMs 13, 14
The identified memory channel could not be properly trained and has been mapped out.
```

Os registros direcionaram o troubleshooting para os módulos DIMM e para o processo de inicialização da memória.

## Testes executados

Foram realizados testes controlados para isolar a causa da falha:

1. Verificação dos eventos de POST e dos registros do IML pelo iLO 5.
2. Reencaixe e validação da posição dos módulos de memória.
3. Inversão dos DIMMs entre os processadores, mantendo a população controlada.
4. Teste individual de cada módulo de **32 GB** no mesmo slot de referência (`Processor 1 - DIMM 14`).
5. Os dois módulos testados individualmente reproduziram o erro `221` e impediram a conclusão do POST.
6. Foi realizado um teste cruzado utilizando **2 módulos de 32 GB comprovadamente funcionais** de outro servidor HPE operacional.

## Resultado

Com os módulos de referência instalados no servidor:

```text
Installed System Memory: 64 GB
Available System Memory: 64 GB
```

O equipamento também apresentou:

```text
HPE Memory authenticated in all populated DIMM slots.
Starting all devices. Please wait...
```

O servidor passou normalmente pela etapa de inicialização da memória e prosseguiu com o POST.

## Solução

Os módulos que reproduziam a falha foram removidos e substituídos pelos módulos validados durante o teste cruzado.

Após a substituição:

- POST concluído normalmente;
- 64 GB de memória reconhecidos e disponíveis;
- inicialização do subsistema de memória normalizada;
- servidor novamente operacional.

## Tecnologias utilizadas

- HPE ProLiant DL380 Gen10 Plus
- HPE iLO 5
- Integrated Management Log (IML)
- UEFI / POST
- Memória ECC RDIMM
- Troubleshooting de hardware

## Metodologia

O atendimento foi conduzido seguindo um processo de isolamento de variáveis:

```text
Comportamento anormal observado
        ↓
Inspeção do equipamento
        ↓
POST não concluído
        ↓
Análise via iLO / IML
        ↓
Eventos relacionados à memória
        ↓
Testes individuais dos DIMMs
        ↓
Teste cruzado com memória conhecida como funcional
        ↓
POST normalizado
        ↓
Problema identificado e resolvido
```

> Case documentado sem informações de cliente, endereços IP, hostnames, números de série ou outros identificadores do ambiente.
