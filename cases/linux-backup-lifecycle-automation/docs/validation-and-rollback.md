# Operational Validation and Rollback

[← Back to the case study](../README.md)

## Before a production run

- [ ] Confirm a change window, authorization and backup retention policy.
- [ ] Verify the expected archive mountpoint, filesystem and free space.
- [ ] Confirm how SQL dump generation completes and avoid overlapping schedules.
- [ ] Review the rules for file age and how many recent dumps remain locally.
- [ ] Exercise safety checks in a lab using **synthetic data**.
- [ ] Identify how to monitor disk I/O, memory, exit status and both filesystems.
- [ ] Agree on safe-stop and rollback procedures before changing production.

## After each run

- [ ] Review service logs and the process exit status.
- [ ] Confirm the expected backup is in the archive with its expected size.
- [ ] Check transfer integrity (a byte-by-byte comparison is appropriate for copying).
- [ ] Confirm the source was removed only after the destination was validated.
- [ ] Verify recent source backups were preserved.
- [ ] Review filesystem usage, alerts, job duration, CPU and memory.
- [ ] Verify that the next timer activation is scheduled.
- [ ] Arrange a controlled **database restore test** under the backup acceptance plan.

### Read-only investigation examples

These are fictional paths and service names; apply them only with appropriate authorization.

```bash
findmnt --mountpoint /example/archive
df -h /example/source /example/archive
systemctl list-timers --all
journalctl -u example-backup-migration.service --since 'today 03:30' --no-pager
```

## Safe stop and rollback

1. Prevent **future scheduled invocations** by disabling the timer under an approved change. Disabling the timer does **not** terminate an ongoing migration process.
2. Preserve existing backups and incomplete copies while diagnosing the failure.
3. Do not overwrite destination files or delete originals as a shortcut.
4. Inspect job logs, permissions, mounts, capacity and backup-producer behavior.
5. Restore a previously approved procedure only after evaluating its impact.
6. Escalate if the remaining capacity or storage performance creates production risk.

## What was actually validated

The private operational record documented the initial manual transfer of five dumps with byte-for-byte verification, a separately authorized cleanup of 29 archived dumps, and a successfully scheduled migration of one SQL dump. The scheduled run was verified through service logs, file size, source absence, archive presence, volume capacity and the next timer trigger.

**Not established:** a successful database restore, automated deletion of long-term archive copies, or independently confirmed clearance of the original monitoring alert.
