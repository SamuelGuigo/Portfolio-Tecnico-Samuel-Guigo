# Samuel Guigo — Network & Infrastructure Engineering

I build, configure and troubleshoot network and infrastructure environments, with work spanning **VMware, Windows Server, Linux, Cisco, MikroTik, Zabbix, Grafana, storage and industrial Ethernet**.

This portfolio documents my technical responsibilities, the problems I investigated, implementation decisions and delivery outcomes. It includes professional projects, completed incident work, hands-on labs and architecture deliverables.

## Selected technical work

- **[Server recovery](cases/hpe-proliant-post-memory-troubleshooting/README.md):** isolated a POST memory failure through individual DIMM tests and known-good substitution; restored startup with 64 GB recognized.
- **[Monitoring engineering](cases/zabbix-dell-n1124p-on/README.md):** adapted a Dell N-Series SNMP template for Zabbix 7, corrected discovery issues and retained device-supported telemetry.
- **[Linux implementation](cases/linux-aptly-update-repository/README.md):** deployed an Aptly repository and validated initial package-index consumption from a Linux client.
- **[Network incident response](cases/industrial-ethernet-crc-troubleshooting/README.md):** investigated active interface errors, performed port isolation and worked on link recovery.
- **[Physical infrastructure leadership](cases/data-center-rack-infrastructure-planning/README.md):** led survey, mapping, material specification and staged rack-reorganization planning.

## All 15 technical cases

The delivery stage describes the work documented in each case. Professional practice pages consolidate experience; labs and architecture work are identified explicitly.

| # | Case | Delivery stage | Technical contribution |
|---|---|---|---|
| 1 | [Zabbix 7 template engineering — Dell N1124P-ON](cases/zabbix-dell-n1124p-on/README.md) | Template adaptation and validation | Compatibility fixes, LLD corrections and counter fallback |
| 2 | [VMware ESXi & vCenter infrastructure build](cases/vmware-virtual-infrastructure/README.md) | Preparation / homologation | Windows/Linux guests, resource planning and service handoff |
| 3 | [Windows Server 2022 — AD & DNS](cases/windows-server-ad-dns/README.md) | Preparation / homologation | Guest deployment, directory-service preparation and validation plan |
| 4 | [MikroTik corporate network demonstration](cases/mikrotik-corporate-network-lab/README.md) | Hands-on lab | VLANs, routing, firewall, VPN and failover scenarios |
| 5 | [Zabbix & Grafana infrastructure monitoring](cases/zabbix-grafana-infrastructure-monitoring/README.md) | Professional practice | Collection troubleshooting, dashboards and resource analysis |
| 6 | [Layer 2 incident — MAC flapping](cases/layer2-mac-flapping-troubleshooting/README.md) | Incident investigation | Switch logs, fault-domain analysis and redundancy recommendation |
| 7 | [Industrial Ethernet — CRC and recovery](cases/industrial-ethernet-crc-troubleshooting/README.md) | Incident response | Interface analysis, port isolation and communication recovery |
| 8 | [Data center rack reorganization](cases/data-center-rack-infrastructure-planning/README.md) | Project in progress | Technical leadership, field mapping, materials and execution plan |
| 9 | [HPE ProLiant — POST memory failure](cases/hpe-proliant-post-memory-troubleshooting/README.md) | Recovery validated | Individual DIMM tests, known-good substitution and 64 GB restored |
| 10 | [Backup storage — degraded array](cases/backup-storage-troubleshooting/README.md) | Diagnosis / recovery planning | Array-health assessment, rebuild follow-up and recovery criteria |
| 11 | [Ubuntu & Aptly update repository](cases/linux-aptly-update-repository/README.md) | Implemented / initial validation | Mirrors, snapshots, HTTP publication and client index refresh |
| 12 | [Wazuh & Zabbix security-monitoring lab](cases/wazuh-zabbix-security-monitoring-lab/README.md) | Lab / FIM test validated | Central Windows policy and create/modify/delete event validation |
| 13 | [SOC MVP architecture](cases/soc-mvp-architecture/README.md) | Architecture / execution plan | Component ownership, triage workflow and phased adoption |
| 14 | [Industrial network contingency](cases/industrial-network-contingency-monitoring/README.md) | Preparation / continued monitoring | Reserve ports, persistence checks and activation/rollback runbook |
| 15 | [Fiber and optical troubleshooting](cases/fiber-optical-link-troubleshooting/README.md) | Professional practice | Optics, power interpretation and physical-path diagnosis |

## Explore by service

| Service area | Relevant cases |
|---|---|
| Windows and virtual infrastructure | [VMware build](cases/vmware-virtual-infrastructure/README.md) · [AD/DNS](cases/windows-server-ad-dns/README.md) |
| Monitoring and observability | [Dell SNMP template](cases/zabbix-dell-n1124p-on/README.md) · [Zabbix/Grafana](cases/zabbix-grafana-infrastructure-monitoring/README.md) |
| Network configuration and diagnosis | [MikroTik lab](cases/mikrotik-corporate-network-lab/README.md) · [MAC flapping](cases/layer2-mac-flapping-troubleshooting/README.md) · [Industrial CRC](cases/industrial-ethernet-crc-troubleshooting/README.md) |
| Linux services | [Ubuntu/Aptly repository](cases/linux-aptly-update-repository/README.md) |
| Hardware, storage and physical infrastructure | [HPE recovery](cases/hpe-proliant-post-memory-troubleshooting/README.md) · [Backup storage](cases/backup-storage-troubleshooting/README.md) · [Racks](cases/data-center-rack-infrastructure-planning/README.md) · [Fiber](cases/fiber-optical-link-troubleshooting/README.md) |
| Security monitoring and operational readiness | [Wazuh lab](cases/wazuh-zabbix-security-monitoring-lab/README.md) · [SOC MVP](cases/soc-mvp-architecture/README.md) · [Network contingency](cases/industrial-network-contingency-monitoring/README.md) |

## How I document delivery

Each case explains the environment or requirement, my technical work, the reasoning behind key decisions and the resulting delivery state.

For ongoing projects, the implemented work and remaining milestones are separated. For incident work, observed findings, diagnostic interpretation and recovery results are distinguished. Measurements are included where the case has a recorded result.

## Additional project and evidence

- [Dell N1124P-ON template repository](https://github.com/SamuelGuigo/zabbix-dell-n1124p-on)
- [Detailed HPE memory diagnostic report — Portuguese](cases/hpe-proliant-post-memory-troubleshooting/docs/RELATORIO_TECNICO.md)

## Publication policy

Professional cases are sanitized to preserve their technical value without exposing client systems. Customer names, internal addresses, credentials, hostnames and sensitive topology are excluded.

See [SECURITY.md](SECURITY.md) for the publication and evidence-handling policy.
