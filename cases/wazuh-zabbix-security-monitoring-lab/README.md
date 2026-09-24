# Wazuh & Zabbix Security Monitoring Lab

Internal laboratory case focused on validating security telemetry and infrastructure monitoring before production use.

## Objective

Evaluate monitoring and detection components in a controlled environment before integrating them into a broader security-operations MVP.

## Components explored

- Wazuh Agent on Windows
- agent groups
- File Integrity Monitoring (FIM)
- Syscollector
- Vulnerability Detection
- initial Sysmon integration study
- Zabbix for availability and capacity monitoring

## Why I keep this as a lab

Installing agents does not make a security operation production-ready.

Before promotion, I expect evidence for:

- stable data collection;
- retention;
- rule tuning;
- severity definitions;
- false-positive handling;
- escalation;
- backup and recovery;
- documented runbooks;
- authorized assets and scope.

## Test scenarios defined

The lab was designed to support controlled tests such as:

- agent communication loss;
- monitored-file changes;
- hardware/software inventory;
- vulnerability detection;
- Sysmon events;
- critical disk usage;
- service failure;
- alert-to-triage-to-resolution workflow.

## Technologies

- Wazuh
- Zabbix
- Windows
- Linux
- FIM
- Vulnerability Detection
- Sysmon
- Security Monitoring

## Status

This repository documents a **lab / validation environment**, not a production SOC and not 24x7 security coverage.

## Confidentiality

No production customer data, credentials, addresses or identifying infrastructure information is included.
