# Enterprise Infrastructure — Final Technical Handover (October 2026)

[← Technical portfolio](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure / Virtualization / Security Engineer  
**Technical workstream status:** Concluded on 9 October 2026  
**Customer-wide acceptance:** Not claimed

## Executive summary

Concluded my assigned technical workstream on a multi-service infrastructure modernization project after overnight implementation and validation activities. The scope combined hypervisor migration, Windows/Linux infrastructure services, endpoint protection, security monitoring and observability. This is a sanitized professional account, not a customer configuration backup or final contractual acceptance report.

## Work performed and verified in project history

| Workstream | Recorded delivery | Boundary |
|---|---|---|
| VMware ESXi → Proxmox VE | Migrated workloads, checked Proxmox operation, VirtIO/guest integration and Windows activation after virtual-hardware changes | Does not imply tested disaster recovery or unconditional acceptance of every application |
| Windows Server 2022 | Prepared infrastructure VMs and AD/DNS service environment; worked through licensing and post-migration guest checks | Directory-wide health, application-owner signoff and DR are separate validations |
| Linux update distribution | Implemented Ubuntu/Aptly internal mirror and HTTP publication; validated APT package-index consumption from a client | Does not establish a fully tested fleet-wide patch campaign |
| WSUS | Windows update infrastructure configured and synchronization work coordinated with the responsible team member | Final GPO rollout and complete endpoint compliance not independently claimed |
| Security monitoring | Wazuh access and dashboard validation, agent and inventory/vulnerability visibility and technical demonstration preparation | No claim of 24×7 SOC, fully tested FIM, active response or complete agent coverage |
| Infrastructure monitoring | Zabbix dashboard access restored, initial host-group/agent configuration activities performed; Grafana part of broader observability scope | No claim that every target device, trigger, alert and graph is production-homologated |
| Endpoint security | Worked on Symantec Endpoint Protection Manager certificate/hostname issue and antivirus rollout to Windows VMs; installation work completed during final shift | Agent-to-manager health, policy coverage and central reporting require documented evidence before broad compliance claims |
| Networking | Industrial switching, routes/VLAN and server-interconnection activities, with validation coordinated around maintenance windows | No sensitive topology reproduced |
| Storage and backup | TrueNAS/QNAP and backup integration considered in delivery and handover | No claim of a successful end-to-end restore, complete NAS integration or final backup acceptance |
| Secure remote access | Temporary transitional connectivity and evaluation/implementation of controlled access tooling | Transitional access must be reviewed and retired according to operations policy |

## Final overnight activities (8–9 October 2026)

1. Investigated and worked around the endpoint-protection manager access problem associated with a certificate/hostname mismatch after infrastructure changes.
2. Prioritized deploying endpoint antivirus software to the Windows VMs before the operational cutoff. Installation activities were completed according to the shift report, while centrally managed enrollment/health should be evaluated separately.
3. Validated Linux host access and package-update considerations; avoided implying that every Linux node had been patched or fully homologated.
4. Recovered access to the Wazuh web interface using its HTTPS endpoint; prepared a walkthrough focused on actual implemented capabilities.
5. Recovered access to Zabbix and progressed host-group and agent onboarding.
6. Reviewed the technical demonstration/meeting scope. A formal standalone Wazuh presentation and customer signoff are **not** claimed.
7. Closed the assigned engineering workstream and prepared evidence/documentation for management handover.

## What “concluded” means

The assigned implementation and troubleshooting activities were reported finished. This **does not** assert that the entire customer project, all operational controls or all third-party acceptance tests are completed. Responsible teams should explicitly track any residual actions.

## Handover verification items

- Export and secure internally approved evidence of endpoint protection coverage, policies and agent-to-manager communication.
- Verify AD/DNS replication, name resolution, authentication and time sync against the formal acceptance matrix.
- Confirm WSUS targeting/GPOs and client compliance; confirm Linux patch scope and repository lifecycle.
- Review Wazuh agent inventory, alert ingestion and vulnerability feeds and document monitoring ownership.
- Confirm Zabbix agent health, SNMP coverage, host groups, triggers and escalation contacts.
- Validate backup jobs, off-host retention and an actual restore test; check storage integrations.
- Remove temporary remote-access paths and verify least-privilege production access.
- Capture client/operations approval separately from engineering completion.

## Evidence policy

Screenshots, console exports, certificates, credentials, internal IPs and network diagrams must remain in approved private evidence repositories. This public case contains no such artifacts.

## Technologies

Proxmox VE · VMware ESXi · KVM/QEMU · VirtIO · Windows Server 2022 · Active Directory · DNS · WSUS · Ubuntu · Aptly · Symantec Endpoint Protection · Wazuh · Zabbix · Grafana · Siemens Industrial Ethernet · TrueNAS · QNAP · Backup · Secure remote administration
