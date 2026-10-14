# Architecture and Risk Review

[← Back to the case study](../README.md)

## Conceptual workflow

```text
SQL dump producer
        |
        v
Local filesystem (recent backups)
        |
        v
systemd timer -> one-shot migration
        | validate mountpoint and available space
        | preserve newest files and enforce a minimum age
        | prevent concurrent executions; inspect file use
        | stage a temporary copy; verify bytes
        | publish the archive file; remove the source
        v
Separate historical archive volume
```

This diagram summarizes general principles of the work. It does **not** disclose the employer's production source code, filesystem paths, configuration, logs or infrastructure identifiers.

## Risk assessment

| Risk | General safeguards | Important limitation |
|---|---|---|
| Archive not mounted or wrong device | Validate mountpoint, filesystem and available capacity | Mounted volumes can change after checks |
| Incomplete backup | Minimum age, recent-file retention and stability checks | The dump generator may rewrite an older file |
| File open by a process | Check with `fuser` and fail on detectable errors | Point-in-time checks are not race-free |
| Concurrent migration | Exclusive lock such as `flock` | Independent tools may ignore the lock |
| Truncated or corrupt transfer | Temporary destination file and byte-for-byte check using `cmp` | Does not prove a SQL database can be restored |
| Existing destination name | Never overwrite without investigation | Manual conflict resolution may be necessary |
| Storage growth | Destination usage limit, reserved free capacity and monitoring | Historical retention must be addressed separately |
| Disk I/O or memory contention | Off-peak scheduling, low-priority I/O and telemetry | Performance impact cannot be excluded |
| Data loss from deletion | Remove the source only after a verified transfer | Recovery still depends on an adequate backup strategy |

## Change-management checklist

1. Confirm authorization, backup ownership, retention requirements and scope.
2. Determine when each SQL dump is finished and whether its source file may reopen.
3. Validate filesystem health, mounts and free capacity on both volumes.
4. Establish monitoring, a safe stop plan and a rollback procedure.
5. Test eligibility and failure handling with synthetic files before production.
6. Observe the first scheduled transfer and record completion, resource use and errors.
7. Confirm the archived file's integrity, original-file state and next timer.
8. Conduct a separate database restore test when required for backup acceptance.

## Separate historical cleanup

The documented recovery of **approximately 233 GB** came from a **one-time, authorized, manual deletion** of 29 historical backups. This deletion was not performed by the scheduled migration service. It should not be confused with ongoing retention automation.

The [public Bash example](../examples/retention-preview.sh) is intentionally read-only: it previews file eligibility and cannot migrate or delete files.
