# VMware ESXi & vCenter — Virtual Infrastructure Build

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer  
**Delivery:** Environment preparation and service homologation

## Project summary

I prepared a VMware environment for Windows Server and Linux infrastructure services. My work included ESXi/vCenter preparation, VM provisioning, guest installation, resource planning and the technical documentation needed to continue service configuration.

The build supported directory services, DNS, update distribution, logging/time services, backup and an application-server workload. I tracked these as individual deliveries with their own dependencies and readiness status.

## Business requirement

The environment needed a consistent foundation for several infrastructure roles. Creating the VMs was one part of the work; the services also depended on networking, operating-system configuration, licensing, storage and operational ownership.

I organized the build so that guest preparation could progress while the definitive network and remaining service configuration were completed.

## My implementation scope

- Prepared the ESXi environment and its association with vCenter.
- Provisioned Windows Server 2022 and Ubuntu Server guests.
- Assigned resources according to each intended service role.
- Installed guest operating systems, updates and VMware Tools where applicable.
- Prepared baseline system configuration and documented dependencies.
- Used preparation-stage snapshots for controlled changes.
- Recorded backup, monitoring and acceptance work for handoff.

## Service-oriented build plan

| Workload | Purpose | Scope represented here |
|---|---|---|
| AD/DNS servers | Directory and name services | Windows guest preparation and service homologation |
| Linux infrastructure services | Logging and time services | Ubuntu guest preparation and connectivity dependencies |
| Linux update repository | Controlled package distribution | Separate Aptly implementation and client validation |
| Windows update server | Windows update distribution | Guest and initial service preparation; remaining policy configuration tracked separately |
| Backup server | Backup execution and storage integration | VM preparation and backup-readiness planning |
| Application/database server | Host the business application stack | Windows platform preparation; application installation handled separately |

## Engineering decisions

### Build around roles and dependencies

I planned the guests according to their service responsibilities. That made it possible to record which tasks were operating-system work, which required network completion and which belonged to an application owner.

### Separate temporary preparation from final connectivity

Virtual networking was a dependency of the wider build. I kept definitive addressing and network configuration visible in the handoff instead of treating temporary reachability as the final network design.

### Keep snapshots and backups distinct

Snapshots supported preparation activities. Backup readiness remained a separate deliverable involving the backup platform, storage destination and recovery validation.

### Make the handoff operational

I documented VM roles, preparation state, dependencies and remaining tasks. For the application-server guest, the handoff boundary was a prepared Windows platform, with the application/database stack outside my installation scope.

## Outcome and status

**Delivered:** a prepared ESXi/vCenter environment and provisioned Windows/Linux guests for the planned infrastructure services.

**Progressed through homologation:** service-specific configuration, including the Linux repository described in its own case.

**Remaining at the documented stage:** final network configuration, remaining service settings, backup/restore validation, monitoring and operational acceptance.

This project demonstrates my ability to build the infrastructure foundation and manage the dependencies required to turn it into an operational service.

## Related implementation cases

- [Windows Server, AD and DNS](../windows-server-ad-dns/README.md)
- [Ubuntu and Aptly repository](../linux-aptly-update-repository/README.md)

## Skills demonstrated

VMware ESXi · vCenter · VM provisioning · Windows Server 2022 · Ubuntu Server · Resource planning · Virtual networking · Infrastructure handoff

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
