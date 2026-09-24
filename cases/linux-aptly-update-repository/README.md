# Linux Update Repository with Ubuntu & Aptly

Sanitized professional infrastructure case based on work performed as part of my role at **EGE Soluções**.

## Objective

Prepare an internal Linux update repository so authorized Ubuntu systems could consume controlled package metadata and updates from a local infrastructure service.

## Solution

I configured an Ubuntu Server environment using **Aptly** to mirror and publish selected Ubuntu repositories.

The documented implementation included:

- Ubuntu Server
- Aptly
- Ubuntu Noble repositories
- `noble` and `noble-updates`
- `amd64` architecture
- local HTTP publication
- snapshot-based preparation
- initial client validation using `apt update`

## Validation performed

A Linux client successfully queried the internal repository during the initial homologation stage, validating basic connectivity, repository metadata access and package-index consumption.

## Operational controls considered

I also documented the controls required before promoting the service to broader production use:

- synchronization schedule;
- snapshot retention;
- repository cleanup;
- filesystem monitoring;
- additional client homologation;
- signing and integrity validation;
- configuration backup;
- rollback procedures.

## Technologies

- Ubuntu Server
- Linux
- Aptly
- APT
- HTTP repository publishing
- Package management
- Infrastructure documentation

## Status

Initial repository functionality was validated in homologation. Broader production rollout, retention policy, monitoring and final acceptance remained separate steps.

## Confidentiality

Internal addresses, hostnames, customer names and private infrastructure information were removed.
