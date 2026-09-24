# Zabbix 7 SNMP Monitoring Template — Dell N1124P-ON

**Role:** Monitoring & Network Engineer  
**Type:** Published technical project

## Overview

I developed and adapted an SNMP monitoring template for the **Dell EMC Networking N1124P-ON** for use with **Zabbix 7**.

The work focused on stabilizing a legacy/community-based template, correcting incompatibilities and preserving useful telemetry without exposing production data.

## What I worked on

- Zabbix 7 template compatibility
- ICMP and SNMP availability monitoring
- CPU and memory monitoring
- interface discovery using IF-MIB
- VLAN traffic monitoring
- hardware sensor discovery where supported
- LLD key normalization
- removal of unsupported legacy prototypes
- mitigation of volatile SNMP indexes
- 32-bit traffic-counter fallback when 64-bit HC counters were unavailable
- technical documentation and public sanitization

## Engineering decisions

Some SNMP objects exposed by the device were not stable enough for reliable monitoring. Instead of forcing noisy discovery into production, I disabled or redesigned the affected items and documented the limitation.

For VLAN interfaces without high-capacity counters, I implemented an IF-MIB fallback so traffic visibility could still be retained.

## Technologies

- Zabbix 7
- SNMP
- ICMP
- IF-MIB
- LLD
- Dell Networking
- Network Monitoring
- Troubleshooting

## Source

The complete template, documentation, changelog and security notes are available in the dedicated public repository:

**https://github.com/SamuelGuigo/zabbix-dell-n1124p-on**

## Confidentiality

The public project contains no credentials, SNMP communities, internal IP addresses or customer-identifying data.
