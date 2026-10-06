# VMware to Proxmox VE Migration — Cluster, Guests & Validation

[← Technical portfolio](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer  
**Delivery:** Migration and validation in progress

## Project summary

I am participating directly in the migration of a virtual infrastructure from VMware ESXi to Proxmox VE.

The work covers host preparation, cluster configuration, workload migration, adaptation of Windows guests to KVM/QEMU, storage integration and post-migration validation. The project is being executed in stages so that each workload can be validated before the next one is moved.

## Scope

The environment includes Windows Server and Linux workloads providing infrastructure and application-support services.

My work includes:

- Proxmox VE installation and host preparation;
- cluster creation and node integration;
- guest migration from VMware;
- VirtIO driver installation;
- QEMU Guest Agent deployment and validation;
- memory-ballooning review;
- Windows Server licensing/activation follow-up after hypervisor change;
- temporary remote-access enablement during the transition;
- validation of boot, network, storage and services after migration.

## Guest adaptation

VMware guests moved to KVM/QEMU require specific attention to virtual hardware and guest integration.

### Windows guests

I worked with:

- VirtIO driver ISO;
- VirtIO storage/network support;
- QEMU Guest Agent;
- UEFI/OVMF guest configuration where applicable;
- network adapter validation;
- memory allocation and ballooning behavior;
- Windows Server 2022 Datacenter activation validation after the hypervisor change.

The hypervisor transition changed the virtual hardware identity exposed to Windows, so activation status was treated as a separate post-migration validation item rather than assumed to remain unchanged.

## Cluster and transition model

The migration uses a staged model:

1. prepare the definitive Proxmox host;
2. join the required nodes to the cluster;
3. move or restore workloads in a controlled order;
4. validate each guest;
5. keep rollback options available while the transition is open;
6. retire temporary components only after validation.

## Validation checklist

For each migrated VM:

- boot without recovery errors;
- expected CPU/RAM allocation;
- network connectivity;
- DNS and gateway behavior;
- storage availability;
- required services running;
- guest agent state;
- Windows activation state when applicable;
- remote administration;
- application-owner validation when applicable.

## Delivery state

**Validated so far:** Proxmox host and cluster operation, migrated guest operation for selected workloads, VirtIO/QEMU Guest Agent on pilot Windows guests, and post-migration Windows activation on validated servers.

**Still in progress:** completion of all workload migrations, final backup/recovery validation, production acceptance and retirement of transitional components.

## Skills demonstrated

Proxmox VE · VMware ESXi · KVM/QEMU · VirtIO · QEMU Guest Agent · Windows Server · Linux · Cluster administration · VM migration · Troubleshooting · Change validation

## Confidentiality

Customer names, addresses, hostnames, credentials and sensitive topology are omitted.
