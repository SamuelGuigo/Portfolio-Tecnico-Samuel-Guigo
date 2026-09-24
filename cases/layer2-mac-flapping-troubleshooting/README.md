# Layer 2 Network Troubleshooting — MAC Flapping Investigation

**Role:** Network Troubleshooting Engineer  
**Type:** Troubleshooting case

## Situation

Multiple virtual machines became unavailable at the same time and the initial evidence pointed toward a Layer 2 network problem rather than an isolated server failure.

## Investigation

I correlated the service impact with switching events and investigated **MAC address flapping** across the network.

The troubleshooting process included:

- reviewing switch logs;
- correlating events with the outage window;
- identifying MAC movement between interfaces;
- reviewing redundant Layer 2 paths;
- analyzing STP behavior;
- checking link-aggregation assumptions;
- evaluating possible loop or path ambiguity;
- separating network symptoms from virtualization symptoms.

## Technical reasoning

MAC flapping can occur when the same source MAC is learned repeatedly through different interfaces.

Depending on the topology, this can indicate:

- Layer 2 loops;
- redundant links without correct aggregation;
- incorrect LACP configuration;
- unexpected bridge behavior;
- topology changes;
- cabling or design mistakes.

Rather than changing multiple components at once, I used switch evidence and topology relationships to narrow the fault domain.

## Recommendation

The investigation supported reviewing the redundant topology and using properly designed link aggregation where appropriate to reduce path ambiguity.

## Technologies

- Cisco Switching
- Layer 2
- STP
- LACP
- MAC Address Tables
- Switch Logs
- Network Troubleshooting

## Result

The investigation converged on Layer 2 behavior and provided a technical direction for correcting the topology.

## Confidentiality

Hostnames, MAC addresses, switch names, customer identity, interface numbers and private topology details were removed.
