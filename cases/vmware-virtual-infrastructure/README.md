# Greenfield Data Center Implementation — HPE, VMware, Storage & Network Infrastructure

[← All 15 technical cases](../../README.md)

**Author:** Samuel Guigo  
**Role:** Infrastructure Engineer — hands-on data center implementation  
**Project:** New data center build, from physical infrastructure to virtualized services  
**Status:** Implementation in progress

## Project overview

I am implementing a new data center as part of the delivery team. The scope brings together two HPE ProLiant servers, VMware virtualization, a dedicated storage platform, QNAP backup storage, core and industrial switching, and a network-management appliance with Zabbix and Grafana.

I have deployed Windows and Linux virtual machines and worked on their network configuration, including IP addresses, subnet masks, gateways, VLANs and VMware virtual switching. This work forms part of the complete data center implementation, alongside physical networking, storage integration, backup and management services.

## Architecture and implementation scope

| Layer | Platform | Role in the project |
|---|---|---|
| Compute | HPE ProLiant server with VMware ESXi | Host the virtual infrastructure and application-support services |
| Storage | Second HPE ProLiant server | Dedicated storage platform for the virtualization environment |
| Virtualization management | VMware vCenter | Management of the ESXi environment |
| Backup storage | QNAP | Backup destination, distinct from the primary VM storage |
| Core network | Core switch | Central connectivity for the data center components |
| Industrial connectivity | Siemens switches | Industrial network integration; detailed access/uplink roles follow the final network design |
| Virtual network | VLANs and VMware vSwitch configuration | Connect the VM workloads to their intended network segments |
| Network management | RASA appliance with Zabbix and Grafana | Centralized network and infrastructure monitoring |
| Infrastructure services | Windows Server and Ubuntu VMs | Identity, DNS, time, logging, updates, backup and endpoint-security services |

The two HPE servers have different functions: one is the compute host and the other is the storage platform. This is not a two-node ESXi high-availability cluster.

## My implementation responsibilities

My work spans the infrastructure layers required to deliver the environment:

- ESXi deployment work and vCenter integration.
- Provisioning Windows Server and Linux virtual machines.
- Assigning CPU, memory and disk resources to each infrastructure role.
- Configuring guest networking: IP address, subnet mask and gateway.
- Implementing VLAN and vSwitch connectivity as part of the team.
- Working on QNAP and core-switch configuration within the deployment.
- Integrating the server and virtual-machine environment with the physical network.
- Preparing and implementing infrastructure services.
- Documenting the build, dependencies, configuration progress and remaining tasks.

The implementation is shared with the project team. My responsibility is hands-on infrastructure delivery across these workstreams, with individual service tasks and handoffs tracked during the project.

## Virtual machines deployed

The following is the supplied base inventory of the deployed infrastructure VMs. Resource allocations describe this project baseline; a deployed VM and its service's final acceptance are separate milestones.

| VM role | vCPU | RAM | Allocated disk | Intended service |
|---|---:|---:|---:|---|
| AD / DNS 01 | 4 | 8 GB | 80 GB | Active Directory and DNS |
| AD / DNS 02 | 4 | 8 GB | 80 GB | Active Directory and DNS |
| NTP / Syslog | 2 | 4 GB | 60 GB | Time service and centralized log collection |
| Backup Server | 4 | 8 GB | 120 GB | Iperius Full management of agentless VM backup |
| WSUS Server | 4 | 12 GB | 300 GB | Windows Server Update Services |
| EDR Services | 4 | 8 GB | 150 GB | Symantec Endpoint Protection, as specified in the project inventory |
| OT RLSUS | 2 | 4 GB | 200 GB | Linux updates through APT/Git mirroring and an SMTP relay role |

**Base allocated resources:** 24 vCPU, 52 GB RAM and 990 GB of virtual disk across these seven VMs.

These are guest allocations, not the physical capacity of the HPE servers. Backup retention and datastore capacity require separate sizing. The EDR Services name follows the project inventory and does not imply that every endpoint-security capability is already enabled.

Additional application-platform work is tracked separately from this seven-VM base inventory.

## Network implementation

### Guest addressing

I configured IP addresses, subnet masks and default gateways for the deployed workloads as part of establishing their connectivity. Addressing is tied to the assigned network segment and its gateway.

### VLANs and virtual switching

The implementation includes VLAN and VMware vSwitch configuration, with work shared across the team. These settings connect the virtual workloads to the intended physical network segments.

The technical scope therefore includes both the guest operating system and the host's virtual network, rather than stopping at operating-system installation.

### Physical switching

Core-switch configuration and Siemens-switch integration are part of the data center network workstream. The exact access and uplink responsibilities of the Siemens devices follow the final physical network design.

The network handoff must relate each workload's addressing and segment to the corresponding virtual and physical connection.

## Primary storage and backup

The second HPE ProLiant is designated for dedicated storage. The working storage plan uses TrueNAS, with storage configuration and VM datastore migration tracked as implementation milestones.

QNAP serves the backup-storage role. QNAP configuration is part of the implementation, while backup-job validation, retention and restoration testing establish whether the complete backup service is ready.

The Backup Server VM is intended to run Iperius Full for VM backup management. The primary VM storage, backup application and backup destination are treated as separate components with distinct responsibilities.

## Infrastructure services

### Identity and name resolution

Two Windows Server VMs provide the AD/DNS foundation. Their role extends beyond VM availability to directory operation, resolution, replication and authentication validation.

### Time and centralized logging

The Linux NTP/Syslog workload provides the platform for time synchronization and log collection. Service integration includes confirming that the intended systems consume time and send their logs.

### Update distribution

The Windows update workstream includes WSUS. The Linux update workstream includes the Aptly repository, whose initial client package-index consumption was validated.

The OT RLSUS inventory also includes SMTP relay and Git-mirroring roles; these remain distinct service tasks and are not implied to be complete by the successful APT test.

### Endpoint security

The inventory includes a dedicated VM for Symantec Endpoint Protection. VM deployment is recorded separately from endpoint enrollment and policy validation.

### Management and observability

The RASA appliance is part of the network-management deployment scope, with Zabbix and Grafana intended to provide centralized visibility. Appliance commissioning, monitored assets, collection and dashboards are tracked as implementation tasks.

## Progress and remaining milestones

| Workstream | Recorded progress | Next completion milestone |
|---|---|---|
| Virtual infrastructure | ESXi/vCenter work and infrastructure VMs deployed | Complete integrated operational validation |
| Guest and virtual networking | Addressing, VLAN and vSwitch configuration performed within the project | Validate connectivity across all intended paths |
| Physical network and QNAP | Configuration included in the active implementation | Complete integration and service checks |
| Dedicated HPE storage | Defined as a core part of the build | Complete storage commissioning and datastore migration |
| AD/DNS and infrastructure services | Deployment and service configuration progressing | Validate each service with its consumers |
| Linux update repository | Initial package-index consumption validated | Complete wider rollout and operational controls |
| Backup | Server and QNAP included in the architecture | Validate jobs, retention and a scoped restore |
| RASA, Zabbix and Grafana | Included in the management scope | Commission and validate monitoring coverage |

## Delivery outcome

The current delivery is an active greenfield data center implementation with deployed virtual workloads and network configuration already performed. The project combines compute, storage, switching, infrastructure services, protection and observability into one environment.

Final acceptance will cover end-to-end service connectivity, commissioned storage, validated backup recovery, monitoring and operational documentation.

## Related implementation details

- [Windows Server, AD and DNS](../windows-server-ad-dns/README.md)
- [Ubuntu and Aptly repository](../linux-aptly-update-repository/README.md)

## Skills demonstrated

Data center implementation · HPE ProLiant · VMware ESXi · vCenter · Windows Server · Ubuntu · IP addressing · VLANs · vSwitch · Core switching · Siemens networking · TrueNAS planning · QNAP · Backup integration · Zabbix · Grafana · Technical documentation

## Confidentiality

The inventory uses service-role labels. Customer names, internal addresses, hostnames, credentials and sensitive topology are omitted. See the [publication policy](../../SECURITY.md).
