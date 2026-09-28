# Zabbix 7 Template Engineering — Dell N1124P-ON

[← All 13 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Monitoring & Network Engineer  
**Delivery:** SNMP template adaptation, troubleshooting and validation

## Project summary

I adapted and stabilized a community Dell N-Series monitoring template for the **Dell EMC Networking N1124P-ON** in **Zabbix 7**. I corrected compatibility and discovery problems, retained useful device telemetry and documented the limitations of the exposed SNMP objects.

The work involved template engineering, investigation of unsupported items and validation against the switch. My contribution built on an existing community template rather than presenting the entire template as an original implementation.

## Problem and technical scope

The starting point contained legacy definitions and discovery behavior that did not consistently match the target platform. Import compatibility alone was insufficient: the resulting items also needed valid keys, supported objects and stable discovery behavior.

I worked across availability, resource usage, interface traffic, VLAN visibility and hardware sensors.

| Area | Work performed | Reason |
|---|---|---|
| Template compatibility | Corrected Zabbix 7 compatibility issues, including ICMP-related definitions | Make the template usable on the target version |
| VLAN counters | Added IF-MIB 32-bit fallback where HC counters were unavailable | Retain traffic visibility for affected interfaces |
| Process discovery | Disabled discovery dependent on volatile SNMP indexes | Avoid unreliable item-to-process relationships |
| Fan and PSU items | Removed incompatible legacy prototypes | Stop generating unsupported items from unsuitable objects |
| Temperature discovery | Corrected TempUnit LLD key collisions | Give discovered items distinct, usable keys |
| Documentation | Recorded changes and limitations | Make subsequent maintenance understandable |

## Implementation and diagnostic work

### Compatibility before collection

I first addressed the template definitions that prevented clean use in the target Zabbix environment. I then worked on the collected items and discovery rules. This separated a schema/import problem from a device-object problem.

### Object support and discovery behavior

I investigated unsupported responses, including `No Such Instance`, instead of assuming every OID in the inherited template applied to this device.

For fan and PSU monitoring, I removed unsuitable legacy prototypes and retained the device-supported monitoring path. For process discovery, unstable indexes made the discovered relationships unreliable, so I disabled that path rather than retain misleading telemetry.

### Counter fallback

Some VLAN interfaces did not expose the expected high-capacity counters. I implemented the IF-MIB fallback so those interfaces could still be represented.

The fallback has narrower counter capacity than HC counters. It is a compatibility choice whose polling and traffic limitations must remain visible in the documentation.

### LLD key normalization

I corrected a temperature-discovery key collision so discovery could create distinct items. This addressed the template structure itself rather than repeatedly deleting the affected discovered items.

## Validation and outcome

The resulting template was importable and stabilized for the target switch, with coverage for availability, CPU, memory, interfaces, VLAN traffic and supported hardware telemetry.

The delivered value was usable monitoring with known limitations documented. PoE expansion and a dedicated NOC dashboard remained follow-up work.

## Reusable engineering lessons

- Validate object support on the actual device.
- Check discovered-item identity as carefully as the metric value.
- Separate import success, collection success and reliable interpretation.
- Document a fallback's limitations alongside its benefit.

## Project source

[Dedicated template repository](https://github.com/SamuelGuigo/zabbix-dell-n1124p-on)

Related: [Infrastructure monitoring](../zabbix-grafana-infrastructure-monitoring/README.md).

## Skills demonstrated

Zabbix 7 · SNMP · IF-MIB · Low-level discovery · Template maintenance · Hardware telemetry · Counter analysis · Technical documentation

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
