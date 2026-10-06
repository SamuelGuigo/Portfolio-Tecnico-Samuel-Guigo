# TrueNAS & ZFS Storage — SAS JBOD, RAIDZ2 & Hypervisor Integration

[← Technical portfolio](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer  
**Delivery:** Implemented / initial validation

## Project summary

I implemented a TrueNAS/ZFS storage platform intended to support virtual-machine storage during a virtualization-platform transition.

The hardware layer uses six 8 TB SAS disks exposed individually to ZFS through JBOD mode. The pool was designed as RAIDZ2 to provide dual-parity protection while maintaining useful capacity for the environment.

## Storage design

- **6 × 8 TB SAS HDDs**
- controller configured to expose disks individually to the operating system
- ZFS pool using **RAIDZ2**
- approximately **28.9 TiB usable capacity**
- TrueNAS as the storage operating system
- integration path prepared for hypervisor storage use

## Why direct disk visibility matters

ZFS needs direct visibility into individual disks to manage:

- redundancy;
- checksums;
- error detection;
- scrubs;
- device health;
- replacement behavior.

For that reason, the storage design avoids hiding the disks behind a traditional hardware RAID virtual volume.

## Validation

The implementation includes checks such as:

- `zpool status`;
- SMART information per disk;
- READ/WRITE/CKSUM counters;
- pool health;
- device presence and identity;
- network/storage connectivity before workload migration.

## Operational controls

Before using the storage for production workloads, the plan requires:

1. validate the pool and disks;
2. configure the storage network;
3. present storage to the hypervisor;
4. test I/O and stability;
5. confirm backup protection;
6. move workloads in controlled batches;
7. keep the former datastore available for rollback until acceptance.

## Delivery state

**Implemented:** TrueNAS, disk presentation and RAIDZ2 pool, with initial health validation.

**Pending milestones:** complete production storage-network validation, workload migration, backup/restore validation and final production acceptance.

## Skills demonstrated

TrueNAS · ZFS · RAIDZ2 · SAS storage · JBOD · SMART · Storage validation · Virtualization storage · Capacity planning · Rollback planning

## Confidentiality

Customer names, addresses, hostnames, credentials and sensitive topology are omitted.
