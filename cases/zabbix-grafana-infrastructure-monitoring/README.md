# Zabbix & Grafana — Infrastructure Monitoring and Diagnostic Visibility

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Monitoring & Infrastructure Engineer  
**Delivery:** Professional monitoring practice, troubleshooting and reporting

## Professional summary

I work with Zabbix and Grafana to monitor servers, network devices and infrastructure services. My responsibilities cover metric collection, item and discovery troubleshooting, alert interpretation, dashboards and resource-usage analysis.

This case consolidates my monitoring work. The [Dell template case](../zabbix-dell-n1124p-on/README.md) provides a separate, concrete example of the SNMP template engineering within that scope.

## Operational requirement

Monitoring needs to explain the state of the service, not just display a reachable host. A device can respond while its storage approaches capacity or its network interfaces accumulate errors.

I organize the monitoring view around availability, performance, capacity and degradation. This gives troubleshooting a more useful starting point than a single up/down indicator.

## My technical work

- Worked with Zabbix Server, agents and SNMP collection.
- Monitored host availability and network-interface state.
- Analyzed CPU, memory and storage usage.
- Worked on service-health items, triggers and alerts.
- Troubleshot unsupported items and discovery failures.
- Investigated missing counters and unstable SNMP indexes.
- Built or worked with dashboards and Grafana visualization.
- Prepared resource-usage reporting for infrastructure review.

## Collection and interpretation model

| Monitoring layer | Typical evidence | Operational question |
|---|---|---|
| Availability | Host, service and interface status | Is the monitored component responding? |
| Performance | CPU, memory and interface utilization | What is affecting current behavior? |
| Capacity | Storage and utilization trends | Is the component approaching a limit? |
| Degradation | Interface errors and hardware health | Is the component deteriorating while still reachable? |

These layers complement one another. I use their relationship to decide whether an alert points to a service interruption, a resource constraint or an emerging hardware/network problem.

## Troubleshooting the monitoring itself

### Unsupported items

I inspect whether an item is querying a supported object and whether its definition matches the device or agent. Fixing the collection problem comes before using the value in a dashboard or trigger.

### Discovery reliability

Discovery is useful only when the discovered identity remains meaningful. I investigate index changes, key collisions and missing objects because these can make a dashboard misleading even when the collection pipeline is running.

### Counter coverage

I check which counters are actually available on the device. The Dell project required a fallback for interfaces without the expected high-capacity counters, illustrating why one inherited template cannot be assumed to fit every interface.

### Alert usefulness

I review noisy triggers and incomplete coverage in the context of the underlying collection. The goal is to make the signal useful for investigation and response rather than simply increase the number of monitored items.

## Deliverables and professional value

My work produces usable infrastructure visibility, technical findings and resource-usage reporting. It connects monitoring data to the equipment and service behavior being investigated.

This consolidated case does not assign a measured reduction in downtime or troubleshooting time. Its concrete contribution is the configuration, diagnostic work and interpretation needed to make monitoring useful in day-to-day operations.

## Related technical work

- [SNMP template adaptation and validation](../zabbix-dell-n1124p-on/README.md)
- [Industrial interface monitoring and contingency](../industrial-network-contingency-monitoring/README.md)
- [Wazuh and Zabbix laboratory](../wazuh-zabbix-security-monitoring-lab/README.md)

## Skills demonstrated

Zabbix · Grafana · SNMP · Agents · Low-level discovery · Triggers · Capacity analysis · Interface counters · Dashboards · Technical reporting

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
