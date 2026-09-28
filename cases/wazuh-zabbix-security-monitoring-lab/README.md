# SOC Implementation Workstream — Wazuh, Zabbix & FIM Validation

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure & Security Monitoring Engineer  
**Delivery:** Technical implementation and telemetry validation within the internal SOC project

## Project summary

My team and I are implementing the company's internal SOC. This case documents the Wazuh and Zabbix workstream, including my configuration and validation of endpoint telemetry and infrastructure monitoring.

A concrete validated result was the Windows File Integrity Monitoring test: file creation, modification and deletion were recorded through the centralized Windows-group policy.

The implementation scope also covers agent organization, inventory and vulnerability-related telemetry, with Sysmon integration treated as an initial study.

## Role within the SOC implementation

This workstream establishes and validates the telemetry paths needed by the SOC. Controlled tests are used during implementation to check configuration and event collection.

I separated the components being explored from the tests with an observed result. This provides a record of implementation progress and a basis for repeatable validation.

## Technical scope and maturity

| Component | Work represented | Recorded stage |
|---|---|---|
| Wazuh Windows agent | Endpoint telemetry and agent organization | Implementation work |
| Central Windows-group policy | Apply the monitoring policy centrally | Validated for the FIM scenario |
| File Integrity Monitoring | Create, modify and delete a test file | Events observed |
| Syscollector | Hardware/software inventory exploration | Implementation scope |
| Vulnerability Detection | Vulnerability-related telemetry exploration | Implementation scope |
| Sysmon | Integration study | Initial study |
| Zabbix | Availability and capacity monitoring | Infrastructure-monitoring scope |

## FIM test I carried out

### Prepare the controlled test

I used a dedicated test file and the Windows-group monitoring policy. The test was intended to produce recognizable events without involving production documents.

### Generate distinct changes

I exercised three file lifecycle actions:

1. Create the test file.
2. Modify the file.
3. Delete the file.

Each action had a corresponding event to look for, making it possible to validate more than agent connectivity alone.

### Check the received events

The recorded FIM result included **added**, **modified** and **deleted** events.

This demonstrated that the centralized policy worked for the tested Windows scenario and that the monitored changes reached the event view.

## What the result established

| Result | Interpretation |
|---|---|
| File creation event received | The tested addition was detected |
| File modification event received | The tested change was detected |
| File deletion event received | The tested removal was detected |
| Policy applied through the Windows group | Central configuration worked for this scope |

The test validated a specific collection path. Coverage of all endpoints, retention quality and incident-response effectiveness require their own tests.

## Extension scenarios and operational design

I defined additional scenarios for agent communication loss, inventory, vulnerability telemetry, Sysmon events, critical disk usage and service failure.

The broader workflow was alert generation, classification, triage and documented resolution. Before expanding that workflow, the implementation requires stable collection, severity definitions, rule tuning, false-positive handling, backup and runbooks.

## Outcome

I obtained a concrete successful FIM validation through centralized Windows policy and organized the wider monitoring work into testable components.

The deliverable is a validated telemetry scenario within the [internal SOC implementation](../soc-mvp-architecture/README.md). My team and I are extending the deployment through additional integrations, use cases and operational procedures.

## Skills demonstrated

Wazuh · Windows agents · Centralized policy · FIM · Event validation · Syscollector · Security telemetry · Zabbix · Implementation documentation

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
