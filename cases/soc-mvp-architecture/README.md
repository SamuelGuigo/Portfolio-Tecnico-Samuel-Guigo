# SOC MVP Architecture & Execution Plan

Architecture case for a small internal Security Operations Center MVP.

## Goal

Design a minimum viable capability for asset inventory, infrastructure observability, security detection, triage, response evidence and recovery.

## Architecture

The planned stack combined:

- **NetBox** — inventory and infrastructure context
- **Zabbix** — availability, performance and capacity
- **Wazuh** — logs, FIM, inventory and vulnerability-related telemetry
- **VMware / virtualization** — hosting and infrastructure events
- **Backup platform** — protection of critical components and configurations
- **Grafana** — optional operational/executive visualization when useful

## Operating model

The MVP was designed around a small set of authorized internal assets and a repeatable flow:

1. asset inventoried;
2. telemetry received;
3. controlled event generated;
4. alert classified;
5. triage documented;
6. owner engaged;
7. action or risk decision recorded;
8. evidence preserved;
9. incident closed with lessons documented.

## Use cases designed

- agent/host communication loss;
- critical disk usage;
- file-integrity change;
- abnormal authentication;
- applicable vulnerability;
- backup failure and restore validation;
- virtualization infrastructure event.

## Engineering principles

- authorization before testing;
- no disruptive automatic response in the MVP;
- monitoring the monitoring stack itself;
- backup and recovery testing;
- documented severity and escalation;
- tuning before expansion;
- evidence-driven promotion from lab to production.

## Status

This is an **architecture and execution-plan case**. It does not claim a completed 24x7 SOC deployment, approved SLA or full production coverage.

## Confidentiality

Internal asset names, addresses, credentials and organization-specific implementation details were removed.
