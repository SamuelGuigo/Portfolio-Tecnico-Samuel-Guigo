# MikroTik RouterOS — Corporate Network Demonstration Lab

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Network Engineer  
**Delivery:** Hands-on laboratory and repeatable validation workflow

## Project summary

I built a MikroTik RouterOS laboratory to practice and validate business-network scenarios involving segmentation, routing, firewall policy and remote access.

I used the lab to implement configurations, investigate connectivity and examine recovery behavior in a controlled environment. The work is a demonstration project with its own test scope.

## Design problem

A business network needs connectivity rules as well as connectivity itself. A routed path may work while allowing traffic that should be restricted; a VPN may connect while failing to reach the intended network.

I structured the lab around those distinctions so that each feature could be evaluated through its intended behavior.

## Implementation areas

| Area | Work covered | Validation focus |
|---|---|---|
| VLAN segmentation | Separate logical network zones | Correct membership and intended separation |
| Inter-VLAN routing | Provide communication between selected networks | Reachability through the expected path |
| NAT | Prepare edge connectivity | Expected translation and outbound access |
| Firewall | Apply policy between network zones | Allowed traffic works and restricted traffic is blocked |
| Remote access | Explore WireGuard, L2TP and OpenVPN scenarios | Tunnel establishment and access to intended resources |
| WAN resilience | Work with dual-WAN concepts and failover testing | Connectivity behavior during path loss and recovery |
| Documentation | Record configurations and backups | Make subsequent tests repeatable |

The VPN technologies represent lab scenarios; they are not described as one combined production architecture.

## My working sequence

### Define the intended behavior

I began with the topology and the communication requirements between zones. That gave the configuration a testable purpose: which traffic should pass, through which path and under which conditions.

### Implement and establish a baseline

I configured the relevant RouterOS features and checked normal connectivity. The baseline was necessary before deliberately introducing a failure or changing a firewall rule.

### Test policy and connectivity separately

I reviewed routing, NAT and firewall behavior as separate parts of a connection. This kept a successful ping from becoming the only acceptance criterion for the network.

### Introduce failure scenarios

I used the lab for failover and recovery tests. The objective was to observe how connectivity behaved when the normal path changed, then review the configuration and repeat the test.

### Preserve the working state

I included configuration backup and documentation in the lab workflow so that a known state could be restored for the next scenario.

## Validation matrix

These are the repeatable checks used to structure the lab; no pass count or universal VPN interoperability result is asserted.

- Normal communication follows the intended routed path.
- Segmented zones expose only the intended access.
- Remote access reaches the scoped resources.
- WAN-path changes are followed by connectivity and recovery checks.
- The documented configuration can be compared with the device state.

## Outcome

The deliverable is a practical RouterOS learning and validation environment, with configuration work, troubleshooting and repeatable scenarios. It provides a foundation for assessing a business-network change before adapting it to a specific environment.

## Skills demonstrated

MikroTik RouterOS · VLAN · Routing · NAT · Firewall policy · VPN · WireGuard · L2TP · OpenVPN · WAN failover · Configuration documentation

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
