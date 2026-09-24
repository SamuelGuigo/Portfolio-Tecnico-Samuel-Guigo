# Industrial Network Contingency & Monitoring

Sanitized professional case focused on proactive monitoring, interface degradation analysis and controlled network contingency.

## Objective

Reduce recovery time for industrial network failures without redesigning the production topology.

## What I worked on

I combined Zabbix monitoring, switch analysis and contingency preparation to improve visibility and response readiness.

The documented work included:

- separating availability from quality/degradation monitoring;
- monitoring interface errors, link state, utilization, CPU, memory and hardware health;
- comparing interface counters over time;
- identifying recurring degradation on critical links;
- mapping available switch interfaces;
- preparing equivalent contingency ports;
- keeping backup ports administratively disabled during normal operation;
- documenting activation, validation and rollback procedures;
- validating that intended configurations were saved persistently.

## Change-control approach

Contingency was designed to remain non-disruptive during normal operation.

Backup interfaces were prepared in advance and left disabled, so a future migration could follow a documented sequence instead of requiring emergency configuration under pressure.

## Technologies

- Cisco switching
- Zabbix
- Network monitoring
- Layer 2 troubleshooting
- Interface counters
- Runbooks
- Change management
- Rollback planning

## Outcome

The monitoring and contingency work established a repeatable operational process for the scoped switches, while continued monitoring remained necessary for interfaces with active degradation.

## Confidentiality

All client names, hostnames, exact switch ports, VLANs, MAC addresses and internal network identifiers were removed.
