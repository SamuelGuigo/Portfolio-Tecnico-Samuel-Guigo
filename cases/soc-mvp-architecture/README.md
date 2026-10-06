# Wazuh Security Monitoring Baseline — Initial Implementation

[← Technical portfolio](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure & Security  
**Delivery:** Initial implementation / laboratory-to-production evolution

## Project overview

I am implementing Wazuh as the initial security-monitoring platform for an internal infrastructure environment.

The current work is focused on establishing the technical baseline: agent communication, endpoint visibility, inventory context and vulnerability information. The broader SOC architecture, alert triage, escalation, runbooks, retention, backup and operational handover are roadmap items and are **not presented here as completed capabilities**.

## Current implemented scope

The work recorded so far includes:

- Wazuh platform usage and initial agent deployment;
- Windows agent organization and communication;
- hardware/software inventory exploration through Syscollector;
- vulnerability visibility through Wazuh Vulnerability Detection;
- review of endpoint and infrastructure security information;
- documentation of the next technical and operational milestones.

## Components

| Component | Current use | Status |
|---|---|---|
| Wazuh Manager / Dashboard | Central security visibility | Implemented baseline |
| Wazuh Agents | Endpoint telemetry | Initial deployment |
| Syscollector | Hardware/software inventory | Initial use |
| Vulnerability Detection | Vulnerability-related visibility | Initial use |
| FIM | Planned/under study | Not claimed as validated |
| Sysmon | Integration study | Not implemented as a completed feature |
| Zabbix | Availability/capacity monitoring | Separate monitoring workstream |
| NetBox | Asset and infrastructure context | Separate inventory workstream |

## What I do not claim

This case intentionally does **not** claim:

- a production SOC operating 24×7;
- validated incident-response procedures;
- validated FIM create/modify/delete tests;
- completed triage/escalation workflow;
- full endpoint coverage;
- finalized retention;
- automated blocking or response;
- backup/recovery of the complete security stack;
- final operational acceptance.

Those items require their own evidence and validation before being presented as delivered.

## Security work around the platform

The broader security work includes evaluation and prioritization of infrastructure findings such as:

- SMB configuration;
- TLS versions and cipher exposure;
- OpenSSH findings;
- NGINX findings;
- certificates;
- hypervisor vulnerabilities;
- applicability of findings in industrial/OT environments.

The approach is evidence-driven: a scanner finding is not considered corrected simply because a recommendation exists. Applicability, change impact, rollback and retest must be considered.

## Next milestones

- expand authorized endpoint coverage;
- tune agent policies and security data;
- validate selected Wazuh use cases;
- define severity and ownership;
- document runbooks;
- define retention and storage;
- protect the monitoring infrastructure with backup/recovery;
- integrate asset context where useful;
- establish operational acceptance criteria.

## Skills demonstrated

Wazuh · Endpoint security monitoring · Vulnerability visibility · Windows/Linux · Syscollector · Infrastructure security · Documentation · Security architecture planning

## Confidentiality

Customer and internal identifying details are intentionally omitted. See the [publication policy](../../SECURITY.md).
