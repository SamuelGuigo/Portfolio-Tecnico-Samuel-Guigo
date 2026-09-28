# Industrial Network — Interface Monitoring & Prepared Contingency Ports

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Network & Infrastructure Engineer  
**Delivery:** Monitoring analysis, reserve-port preparation and operational runbook

## Project summary

I combined switch analysis and Zabbix monitoring with prepared contingency interfaces for an industrial network.

I examined availability and interface degradation, mapped spare interfaces, prepared equivalent contingency ports and documented activation, validation and rollback. The reserve ports remained administratively disabled during normal operation.

## Operational requirement

A future link failure should not require an operator to reconstruct the interface configuration under pressure.

The project focused on preparation within the existing network design: improving visibility and making a scoped port migration repeatable without introducing an active alternative path during normal operation.

## My technical responsibilities

- Reviewed interface status, errors and utilization.
- Considered CPU, memory and hardware health alongside interface evidence.
- Compared counters over time to identify recurring degradation.
- Mapped available switch interfaces.
- Prepared contingency-port configuration for the scoped connections.
- Kept reserve interfaces administratively disabled.
- Documented activation, service checks and rollback.
- Checked that intended configurations were saved persistently.

## Monitoring decisions

### Separate availability from quality

A link can remain up while accumulating errors. I therefore considered interface-error behavior separately from device reachability and link state.

### Compare observations over time

A historical counter total and continuing error growth are different observations. I used counter comparison to inform which links needed continued attention.

### Connect monitoring to a response

The monitoring work fed the contingency preparation: the operator needed both an indication of degradation and an understood recovery option.

## Contingency preparation

I mapped the available interfaces and prepared equivalent reserve-port settings for the scoped connections.

The reserve configuration needed to reflect the original connection's intended behavior. The preparation was paired with documentation so the relationship between the active connection and its contingency option remained clear.

I left the prepared interfaces shut down in normal operation. That preserved the intended inactive state until an authorized maintenance or recovery action.

## Activation and rollback runbook

The following describes the documented operating sequence, rather than a claim that every reserve interface was live-tested.

| Stage | Required action | Validation focus |
|---|---|---|
| Precheck | Identify the affected connection and corresponding reserve interface | Correct mapping and intended configuration |
| Preparation | Confirm the maintenance action and original state | A known rollback point |
| Activation | Move/activate the scoped connection according to the runbook | Expected link and connectivity behavior |
| Service check | Check the dependent service and interface counters | Operational access and link quality |
| Rollback if needed | Restore the original connection and state | Recovery of the known path |
| Closeout | Record the used interface and configuration | Accurate documentation and persistence |

## Outcome and delivery status

The work established prepared contingency interfaces and a repeatable activation/validation process for the scoped switches.

It also made ongoing interface degradation visible as a separate operational concern. A reserve port is a recovery option; it does not by itself repair a faulty cable or prove that every physical fault is resolved.

**Delivered:** monitoring analysis, reserve-port preparation, inactive normal state, persistence checks and operational documentation.

**Ongoing:** observation of degrading links and any remaining controlled migration validation.

## Related incident

[Industrial Ethernet CRC investigation and recovery](../industrial-ethernet-crc-troubleshooting/README.md)

## Skills demonstrated

Cisco switching · Zabbix · Interface diagnostics · Counter analysis · Contingency planning · Configuration persistence · Runbooks · Change validation · Rollback

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
