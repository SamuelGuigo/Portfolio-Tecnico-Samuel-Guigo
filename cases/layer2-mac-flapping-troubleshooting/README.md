# Layer 2 Incident Investigation — MAC Flapping & Virtual Infrastructure Availability

[← Technical portfolio](../../README.md)

**Author:** Samuel Guigo  
**Role:** Network & Infrastructure Engineer — hands-on incident investigation  
**Environment:** Production network supporting virtual infrastructure  
**Scope:** Switching logs, MAC learning, redundant paths and remediation planning

## Executive summary

I investigated a connectivity incident that made several infrastructure resources unavailable at the same time, including virtual machines, management interfaces and monitoring. I accessed a switch adjacent to the virtualization infrastructure, collected switching logs and correlated the outage with MAC-flapping events.

The investigation identified unstable Layer 2 forwarding as a priority fault domain. I connected the switching evidence to the redundant network paths and developed a remediation direction around reviewing the topology and evaluating properly designed link aggregation.

This case documents the investigation I performed and the engineering recommendation that followed. The recommendation is separate from a completed topology change.

## Operational problem

The initial symptom was broader than one failed VM. Several resources sharing the network path became unreachable together. Treating each unavailable resource as an independent server problem would have fragmented the investigation.

My first task was to establish whether the common dependency was the network. The scope of the outage made the switching path a stronger starting point than unrelated changes inside individual guest operating systems.

## My technical responsibilities

I performed the network investigation, including:

- accessing the switching infrastructure near the affected virtualization environment;
- collecting and reviewing switch logs;
- correlating switching events with the period of service unavailability;
- identifying repeated learning of the same MAC through different interfaces;
- examining how the redundant paths related to that behavior;
- assessing STP and link-aggregation assumptions;
- translating the findings into a topology-remediation recommendation.

My contribution was the diagnosis and technical reasoning that connected an infrastructure-wide symptom to a shared network fault domain.

## Investigation and decisions

### 1. Establish the extent of the failure

I considered the simultaneous loss of VM access, infrastructure management and monitoring together. That combination supported investigating the shared connectivity path before changing individual servers.

**Decision:** prioritize the common network dependency while keeping virtualization symptoms in the incident timeline.

### 2. Use switching evidence to identify the fault domain

I collected logs from the accessible switch and found MAC-flapping behavior: the same source MAC was being learned through different interfaces.

A MAC move on its own does not prove a loop. In this incident, I evaluated the repeated movement alongside the service disruption and the redundant network layout.

**Decision:** treat the events as evidence of unstable forwarding requiring topology analysis, rather than label every MAC move as a separate endpoint failure.

### 3. Review the redundant paths

I examined the relationship between the interfaces involved and the redundant links. The investigation raised a concern that the available paths were not behaving as an effective, controlled redundancy design.

I also reviewed the assumptions around STP and aggregation. The presence of redundant physical links alone does not establish that they form a correctly configured logical bundle.

**Decision:** investigate path control and aggregation compatibility before proposing additional configuration changes.

### 4. Define a remediation direction

The proposed direction was to review the redundant interconnection and evaluate LACP/Port-Channel where supported by the devices and topology.

That proposal requires validating the endpoints, VLAN handling, aggregation support and failover behavior before implementation. It is not a blanket recommendation to aggregate any pair of uplinks.

## Evidence and interpretation

| Observation | What it established | Engineering consequence |
|---|---|---|
| Multiple infrastructure resources became unreachable together | A shared dependency was involved | Investigate the common network path |
| Switch logs showed repeated MAC movement between interfaces | Forwarding information was unstable during the investigation | Examine the paths associated with the events |
| Redundant links were part of the affected topology | Redundancy behavior needed review | Assess STP and aggregation assumptions |
| LACP/Port-Channel was proposed | A corrective design direction was defined | Validate feasibility before implementation |

## Outcome and delivery status

**Completed:** switch access, log collection, incident correlation, MAC-flapping investigation and identification of a Layer 2 remediation direction.

**Recommended:** topology review and a compatible aggregation design where appropriate.

The technical outcome was a focused explanation of why the incident needed to be investigated at the switching layer, together with a concrete direction for correcting the redundant-path design. A completed LACP deployment or measured post-change availability improvement is not claimed in this case.

## Skills demonstrated

Cisco switching · Layer 2 troubleshooting · MAC learning · STP analysis · Redundancy design · LACP/Port-Channel assessment · Virtualization connectivity · Incident documentation

## Confidentiality

This account omits customer identity, internal addresses, hostnames, MAC addresses, exact interface identifiers and sensitive topology. It preserves the diagnostic sequence and my technical contribution.
