# Backup Storage Incident — Degraded Array Investigation & Recovery Planning

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer — storage and backup troubleshooting  
**Delivery:** Hardware diagnosis, rebuild assessment and recovery requirements

## Incident summary

I investigated instability in a backup-storage environment and identified a degraded array with rebuild activity and disk-health warnings.

I used the server's management information and storage health to separate system-resource observations from the condition of the array. My priority was to establish the storage state and avoid increasing risk while redundancy was degraded.

## Operational problem

The environment depended on storage for backup data. An accessible logical volume did not establish that the underlying array was healthy or that the stored backups could be restored successfully.

That distinction shaped the investigation: service accessibility, array health and backup recoverability needed separate checks.

## My technical work

- Reviewed the server through its hardware-management interface.
- Checked CPU and memory observations alongside storage health.
- Examined controller and logical-drive status.
- Identified the degraded/rebuilding condition.
- Reviewed disk-health warnings and hardware-event history.
- Followed rebuild activity as part of the investigation.
- Documented the hardware follow-up and recovery-validation requirements.
- Explained the findings and remaining uncertainty for operational decision-making.

## Investigation sequence

### Establish the current state

I checked whether the logical volume was available and whether the array was healthy. The recorded state included accessibility alongside degradation/rebuild activity.

This explained why “the volume is visible” was not enough to close the incident.

### Correlate hardware observations

I reviewed controller, array and disk information together. A warning associated with a disk required attention, but identifying the exact member and current array state remained necessary before physical intervention.

I kept the distinction between the observed degradation and an exhaustively isolated hardware cause.

### Protect the degraded environment

I prioritized careful handling while the array was rebuilding. The troubleshooting approach avoided uncontrolled power cycles or disk removal without confirming the affected member and array condition.

I also considered unnecessary heavy workload in the context of the rebuild, rather than treating the storage as fully healthy because it remained accessible.

### Define a complete recovery path

I documented the follow-up needed beyond hardware replacement: healthy array state, storage-path validation, backup execution and a test restore.

## Evidence and decisions

| Observation | What it meant | Decision |
|---|---|---|
| Logical volume accessible during the documented stage | Data path remained available at that point | Continue checking the underlying hardware |
| Array degraded/rebuilding | Redundancy was not in its normal healthy state | Avoid unnecessary disruption and track rebuild state |
| Disk-health warning | A physical component required investigation | Confirm the affected member before intervention |
| Backup storage involved | Hardware health alone was insufficient for closeout | Require backup and restore validation |

## Outcome and status

I identified the degraded storage condition and established the follow-up required for a safe recovery. The recorded stage included rebuild activity, with final hardware closure and complete restore validation still separate.

The case does not claim successful data recovery or a completed rebuild without a corresponding final result. Its delivered outcome is the diagnosis, risk-aware handling and actionable recovery plan.

## Recovery acceptance criteria

1. Confirm the actual hardware intervention.
2. Verify that the array returns to its expected healthy state.
3. Validate filesystem and backup-storage access.
4. Confirm successful backup execution and retention behavior.
5. Perform and document a scoped restore test.
6. Confirm monitoring of the hardware and backup process.

## Skills demonstrated

Storage troubleshooting · RAID health · Hardware management · Rebuild assessment · Backup dependencies · Recovery planning · Incident reporting

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
