# Windows Server 2022 — Active Directory & DNS Preparation

[← All 13 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Windows & Infrastructure Engineer  
**Delivery:** Windows deployment and AD/DNS homologation

## Project summary

I deployed and prepared Windows Server virtual machines for Active Directory and DNS in a VMware environment. I carried out the guest-system work and prepared the service dependencies, with AD/DNS recorded as functional during the preparation and homologation stage.

The project required a usable directory-services foundation and a clear path to production validation. I documented the remaining checks rather than leaving the service handoff at “Windows installed.”

## Technical responsibilities

My work included Windows Server deployment, VMware Tools installation, operating-system updates and reboots, baseline configuration, AD DS/DNS preparation and documentation of infrastructure dependencies.

I also identified the validation needed for directory health, DNS, time synchronization, backup and monitoring before final acceptance.

## Implementation sequence

### 1. Prepare the Windows guests

I installed and prepared the Windows Server systems on the virtual infrastructure. Guest integration and operating-system updates were part of that baseline.

A consistent guest baseline gives service configuration a known starting point and makes later faults easier to distinguish from installation or integration issues.

### 2. Prepare directory and DNS services

I worked on the systems intended for AD DS and DNS. The service context required the Windows configuration and the surrounding network dependencies to be considered together.

DNS resolution, addressing and time synchronization were therefore included in the validation plan rather than treated as unrelated follow-up topics.

### 3. Record dependencies and ownership

I documented what the server preparation provided and what still required environment-wide validation. This included networking, licensing, service health and protection of the directory infrastructure.

### 4. Define acceptance checks

The documented preparation stage included functional AD/DNS. The wider acceptance plan covered the following checks; this table is a validation plan, not a claim that every check had already passed.

| Area | Acceptance question | Purpose |
|---|---|---|
| Directory health | Are the intended directory services healthy? | Establish service readiness |
| Replication | Do the intended domain controllers replicate correctly? | Validate multi-server consistency |
| DNS | Do required forward and reverse lookups return the expected records? | Validate name resolution |
| Time | Is the intended time hierarchy working? | Support consistent authentication and event correlation |
| Authentication | Can a test account complete the intended sign-in workflow? | Validate service consumption |
| Protection | Are backup and recovery procedures validated? | Establish recoverability |
| Operations | Are monitoring and handoff documentation ready? | Support ongoing administration |

## Outcome and delivery boundary

I delivered the Windows guest preparation and AD/DNS work through the documented homologation stage. The case demonstrates hands-on Windows infrastructure delivery together with explicit service-validation planning.

Final production acceptance remained dependent on completing the wider directory, network, backup and monitoring checks. A completed disaster-recovery exercise is not part of the recorded outcome.

## Deliverables represented

- Prepared Windows Server virtual machines.
- Guest integration and updated operating-system baseline.
- AD/DNS service preparation and functional homologation.
- Infrastructure dependency documentation.
- Production validation and operational handoff requirements.

## Related project

[VMware virtual infrastructure build](../vmware-virtual-infrastructure/README.md)

## Skills demonstrated

Windows Server 2022 · Active Directory Domain Services · DNS · VMware guest administration · Infrastructure dependencies · Service homologation · Technical documentation

## Confidentiality

Customer names, internal addresses, hostnames, credentials and identifying infrastructure details are omitted. See the [publication policy](../../SECURITY.md).
