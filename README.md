# Samuel Guigo — Infrastructure, Network & Security Engineering

I design, implement and troubleshoot infrastructure across **virtualization, Windows/Linux, networking, storage, observability, cybersecurity and industrial Ethernet/OT**.

This portfolio documents professional work, incident response, hands-on implementation, labs and architecture deliverables. Customer names, internal addresses, hostnames, credentials and sensitive topology are intentionally removed.

## Selected technical work

- **[VMware → Proxmox migration](cases/proxmox-virtualization-migration/README.md):** migration of Windows/Linux workloads to Proxmox VE, cluster setup, VirtIO/QEMU adaptation and staged validation.
- **[TrueNAS/ZFS storage](cases/truenas-zfs-storage/README.md):** deployment of a ZFS storage platform with six 8 TB SAS disks in JBOD and RAIDZ2, including SMART and pool-integrity validation.
- **[Industrial Ethernet ring commissioning](cases/industrial-ring-commissioning/README.md):** switch configuration and local validation of an industrial redundancy ring, keeping production acceptance and SAT as separate milestones.
- **[Wazuh security monitoring baseline](cases/soc-mvp-architecture/README.md):** initial Wazuh implementation for endpoint telemetry, inventory and vulnerability visibility, with the broader SOC operating model still in evolution.
- **[Greenfield data center implementation](cases/vmware-virtual-infrastructure/README.md):** HPE compute/storage, infrastructure VMs, VLAN/vSwitch networking, backup storage and monitoring preparation for field deployment.
- **[Server recovery](cases/hpe-proliant-post-memory-troubleshooting/README.md):** isolated a POST memory failure through individual DIMM testing and known-good substitution; startup was restored with 64 GB recognized.
- **[Monitoring engineering](cases/zabbix-dell-n1124p-on/README.md):** adapted a Dell N-Series SNMP template for Zabbix 7 and reduced unsupported items from 13 to 0.
- **[Linux update repository](cases/linux-aptly-update-repository/README.md):** deployed Aptly/Nginx repository infrastructure and validated package-index consumption from a Linux client.
- **[Network incident response](cases/industrial-ethernet-crc-troubleshooting/README.md):** investigated active interface errors, isolated ports and worked through link recovery.
- **[Physical infrastructure leadership](cases/data-center-rack-infrastructure-planning/README.md):** led survey, mapping, material specification and staged rack-reorganization planning.

## Technical cases

The delivery stage is intentionally explicit. **Planned** work is not presented as delivered, and **laboratory** validation is separated from production implementation.

| # | Case | Delivery stage | Technical contribution |
|---|---|---|---|
| 1 | [VMware → Proxmox migration](cases/proxmox-virtualization-migration/README.md) | Migration / validation in progress | Proxmox cluster, VirtIO/QEMU adaptation, staged workload validation |
| 2 | [TrueNAS/ZFS storage](cases/truenas-zfs-storage/README.md) | Implemented / initial validation | 6×8 TB SAS, JBOD, RAIDZ2, SMART and ZFS validation |
| 3 | [Industrial Ethernet ring commissioning](cases/industrial-ring-commissioning/README.md) | Locally validated | Switch configuration and ring validation; final documentation/SAT pending |
| 4 | [Zabbix 7 template engineering — Dell N1124P-ON](cases/zabbix-dell-n1124p-on/README.md) | Template adaptation and validation | Compatibility fixes, LLD corrections and counter fallback |
| 5 | [Greenfield data center implementation](cases/vmware-virtual-infrastructure/README.md) | Implementation in progress | HPE compute/storage, infrastructure VMs, network, backup and monitoring |
| 6 | [Windows Server 2022 — AD & DNS](cases/windows-server-ad-dns/README.md) | Preparation / homologation | Guest deployment, directory-service preparation and validation plan |
| 7 | [MikroTik corporate network demonstration](cases/mikrotik-corporate-network-lab/README.md) | Hands-on lab | VLANs, routing, firewall, VPN and failover scenarios |
| 8 | [Zabbix & Grafana infrastructure monitoring](cases/zabbix-grafana-infrastructure-monitoring/README.md) | Professional practice | Collection troubleshooting, dashboards and resource analysis |
| 9 | [Layer 2 incident — MAC flapping](cases/layer2-mac-flapping-troubleshooting/README.md) | Incident investigation | Switch logs, fault-domain analysis and redundancy recommendation |
| 10 | [Industrial Ethernet — CRC and recovery](cases/industrial-ethernet-crc-troubleshooting/README.md) | Incident response | Interface analysis, port isolation and communication recovery |
| 11 | [Data center rack reorganization](cases/data-center-rack-infrastructure-planning/README.md) | Project in progress | Technical leadership, field mapping, materials and execution plan |
| 12 | [HPE ProLiant — POST memory failure](cases/hpe-proliant-post-memory-troubleshooting/README.md) | Recovery validated | Individual DIMM tests, known-good substitution and 64 GB restored |
| 13 | [Ubuntu & Aptly update repository](cases/linux-aptly-update-repository/README.md) | Implemented / initial validation | Mirrors, snapshots, HTTP publication and client index refresh |
| 14 | [Wazuh security monitoring baseline](cases/soc-mvp-architecture/README.md) | Initial implementation | Agents, endpoint visibility, inventory and vulnerability monitoring |
| 15 | [Industrial network contingency](cases/industrial-network-contingency-monitoring/README.md) | Preparation / continued monitoring | Reserve ports, persistence checks and activation/rollback runbook |
| 16 | [Fiber and optical troubleshooting](cases/fiber-optical-link-troubleshooting/README.md) | Professional practice | Optics, power interpretation and physical-path diagnosis |

## Professional scope represented

### Datacenter & Virtualization
Proxmox VE · VMware ESXi/vCenter · KVM/QEMU · VirtIO · Windows Server · Linux · TrueNAS/ZFS · QNAP · backup and recovery

### Networks & OT
Cisco · MikroTik · Siemens industrial Ethernet · VLANs · STP/LACP · routing · VPN · CRC/FCS analysis · optical troubleshooting

### Monitoring & Security
Zabbix · Grafana · SNMP/LLD · Wazuh · vulnerability monitoring · NetBox · infrastructure observability

### Infrastructure Services
Active Directory · DNS · WSUS · NTP/Syslog · Aptly/Nginx repositories · PowerShell · Linux administration

## How I document delivery

Each case separates:

- environment or requirement;
- what I personally worked on;
- tests and evidence;
- implementation decisions;
- validated result;
- open risks and remaining milestones.

Ongoing projects do not claim final acceptance before it happens. Laboratory work is labeled as laboratory work. Security-monitoring implementation is not described as a 24×7 SOC unless that capability is actually validated.

## Additional project and evidence

- [Dell N1124P-ON Zabbix template repository](https://github.com/SamuelGuigo/zabbix-dell-n1124p-on)
- [Detailed HPE memory diagnostic report — Portuguese](cases/hpe-proliant-post-memory-troubleshooting/docs/RELATORIO_TECNICO.md)

## Publication policy

Professional cases are sanitized to preserve their technical value without exposing customer systems. Customer names, internal addresses, credentials, hostnames and sensitive topology are excluded.

See [SECURITY.md](SECURITY.md) for the publication and evidence-handling policy.
