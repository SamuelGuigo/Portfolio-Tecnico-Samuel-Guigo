# HPE ProLiant DL380 Gen10 Plus — POST Memory Failure Diagnosis & Recovery

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer — hardware diagnosis and replacement testing  
**Delivery:** Server startup restored with 64 GB recognized

## Incident summary

I diagnosed a server that could not complete POST and restored startup by replacing the memory modules that reproduced the failure with validated DIMMs.

I identified the symptom during an infrastructure inspection, used HPE iLO 5 and the Integrated Management Log (IML) to narrow the fault domain, tested the original DIMMs individually and performed a cross-test with known-good memory.

## Equipment and evidence

| Item | Recorded value |
|---|---|
| Platform | HPE ProLiant DL380 Gen10 Plus |
| Remote management | HPE iLO 5 |
| System ROM observed | U46 v1.72 |
| Memory technology | ECC RDIMM |
| Reference modules | Two 32 GB DIMMs |
| Validated final memory | 64 GB installed and available |

## Initial symptoms

During the inspection, I observed sustained high fan speed and a flashing red health LED. I accessed the remote console and found that startup stopped at:

```text
Memory Initialization - Start

221 - Unknown Initialization Error
The system has experienced a fatal initialization error.
System Halted!
```

The console established that the failure occurred during memory initialization, before normal startup could complete.

## Log analysis

I inspected the IML and found memory-related events:

```text
462 - Uncorrectable Memory Error Threshold Exceeded
Processor 2, DIMM 14
```

```text
223 - DIMM Initialization Error
Processor 2 DIMMs 13, 14
The identified memory channel could not be properly trained
and has been mapped out.
```

These events directed the investigation toward the DIMMs and the memory-initialization path. I used physical testing to distinguish a module-related problem from other possible causes.

## Tests I performed

### 1. Reseat and review population

I repositioned and reseated the modules in a controlled sequence. The objective was to check seating and population while avoiding unrelated changes.

### 2. Swap the original DIMMs

I moved the modules between processors while retaining reference positions. This tested whether the behavior would follow the modules or remain tied to the original memory path.

### 3. Test each original module individually

I tested each 32 GB module separately in the same reference slot.

**Observed result:** both original modules reproduced error `221` and prevented POST completion.

Using the same reference position made the comparison more meaningful than changing the module and the test location simultaneously.

### 4. Cross-test with known-good memory

I installed two known-good 32 GB modules from an operational HPE server.

**Observed result:**

```text
Installed System Memory: 64 GB
Available System Memory: 64 GB

HPE Memory authenticated in all populated DIMM slots.
Starting all devices. Please wait...
```

The server passed memory initialization and continued through POST.

## Diagnostic conclusion

| Test | Observation | Interpretation |
|---|---|---|
| Original modules tested individually | Both reproduced the startup failure | The failure remained reproducible with the original DIMMs |
| Known-good modules installed | Memory initialization succeeded | The replacement configuration restored startup |
| Final memory check | 64 GB installed and available | The expected replacement capacity was recognized |

The controlled substitution supported replacing the original modules. The outcome is specific to the tested configuration; it does not require claiming that every other memory slot was exhaustively tested.

## Verified result

- POST completed normally.
- Memory initialization was restored.
- 64 GB was recognized and available.
- The server returned to an operational startup state.

## Supporting documentation

- [Detailed technical report — Portuguese](docs/RELATORIO_TECNICO.md)
- [Case changelog](CHANGELOG.md)
- [Evidence publication guidance](SECURITY.md)

The technical report preserves the original diagnostic sequence and log excerpts. A sanitized evidence gallery remains a separate documentation task.

## Skills demonstrated

HPE ProLiant · iLO 5 · IML · POST diagnostics · ECC RDIMM · Hardware fault isolation · Controlled substitution · Server recovery

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
