# Linux SQL Backup Lifecycle Automation — Production Case Study

[← Technical portfolio](../../README.md) · [Versão em português](README.md)

**Author:** Samuel Guigo  
**Scope:** Linux troubleshooting, storage, backups and automation  
**Status:** First scheduled transfer successfully validated; follow-up checks remain  
**Attribution:** Professional work within a team, separate from Auron Tech commercial projects.

## Problem

A production Linux monitoring server experienced high system filesystem usage. Scheduled Zabbix SQL dumps accumulated locally because historical copies were moved to a separate archive volume manually. The recurring growth posed a capacity and continuity risk.

The goal was to recover disk space, preserve the integrity of backups and turn the manual transfer of older dumps into a repeatable, controlled task without modifying dump creation or restarting monitoring services.

## My work

- Investigated filesystem usage and mountpoints using `df`, `du`, `lsblk`, `findmnt` and `find`.
- Transferred five older SQL backups and compared source and destination byte for byte before removing originals interactively.
- Refined Bash migration controls for backup age, retention of the two latest files, destination capacity/mount validation, concurrency protection and integrity checking.
- Configured a daily `systemd` oneshot service and timer.
- Separately performed a specifically authorized **manual archive cleanup** of 29 old SQL dumps under a one-time cutoff. The automatic routine does **not** purge historical archives.
- Validated the first scheduled run using service logs, source absence, destination presence, exact file size, filesystem capacity and the next trigger time.

## Evidence-based outcomes

| Measurement | Documented result |
|---|---|
| System filesystem occupancy | Reduced from **89%** to **29%** |
| Initial controlled migration | **5 dumps** transferred and byte-compared |
| Separate archive cleanup | **29 files** removed manually |
| Archive capacity recovered | Approximately **233 GB** according to filesystem measurements |
| Archive usage | **76% → 35%** after cleanup, then **36%** after the scheduled migration |
| First scheduled run | **1 dump** moved and validated; service completed successfully |
| Ongoing schedule | Following daily timer activation confirmed |

A byte-for-byte comparison proves **transfer integrity**, not database consistency or restore readiness.

## Operational design

The workflow separates active local backups from historical archive files. It preserves two recent backups, requires an age threshold, checks archive availability and capacity, uses single-instance locking, stages transfers under temporary names, checks file stability and compares bytes before removing an original. Open-file checks are not fully race-free; behavior of the backup producer must be coordinated.

See [architecture and risks](docs/architecture-and-risk.md) and the [validation/rollback checklist](docs/validation-and-rollback.md).

## Open items

- Database restore test was not part of this scope.
- Memory and I/O consumption deserve additional monitoring.
- The original monitoring alert has not been independently confirmed as cleared.
- No automated long-term archive deletion/retention policy was introduced.

## Educational example

- [Read-only eligibility preview](examples/retention-preview.sh)
- [Synthetic test](examples/test-preview.sh)

```bash
bash examples/test-preview.sh
```

This example was independently authored; it never copies, moves or deletes backup files. **It is not the proprietary script deployed in production.**

## Confidentiality

Customer and employer-identifying data, internal addresses, hostnames, mount paths, screenshots, logs and operational source code are excluded. This is professional team experience, **not an Auron Tech delivery**. See [publication policy](../../SECURITY.md).
