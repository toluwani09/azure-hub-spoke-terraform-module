# Azure Hub and Spoke Terraform Module

This Terraform module provides a reusable infrastructure setup for deploying an Azure environment using a Hub and Spoke network topology. It includes the creation of a Resource Group, Virtual Networks (VNets), Subnets, Network Security Groups (NSGs), and Virtual Machines (VMs). Additionally, it sets up a self-hosted agent for CI/CD pipelines.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Modules](#modules)
  - [Resource Group](#resource-group)
  - [Network](#network)
  - [Network Security Group](#network-security-group)
  - [Virtual Machines](#virtual-machines)
  - [Self-Hosted Agent](#self-hosted-agent)
- [Examples](#examples)
- [Scripts](#scripts)
- [Architecture](#architecture)
- [License](#license)

## Prerequisites

- Terraform installed on your local machine.
- An Azure account with sufficient permissions to create resources.
- Azure CLI installed and configured.

## Usage

To deploy the infrastructure, clone this repository and navigate to the `examples/minimal` directory. Modify the `terraform.tfvars.example` file to set your desired variable values, then run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

## Modules

### Resource Group

This module creates an Azure Resource Group.

- **Input Variables**: Location, Resource Group Name
- **Outputs**: Resource Group ID

### Network

This module sets up the Hub and Spoke network topology.

- **Input Variables**: Address spaces, Subnet configurations
- **Outputs**: VNet IDs, Subnet IDs

### Network Security Group

This module creates Network Security Groups and defines security rules.

- **Input Variables**: NSG names, Rules
- **Outputs**: NSG IDs

### Virtual Machines

This module provisions two Virtual Machines in their respective VNets.

- **Input Variables**: VM names, Sizes, SSH configurations
- **Outputs**: Public IP addresses, VM IDs

### Self-Hosted Agent

This module sets up a self-hosted agent for CI/CD pipelines.

- **Input Variables**: Agent configurations
- **Outputs**: Agent details

## Examples

Refer to the `examples/minimal` directory for a minimal example of how to use this module.

## Scripts

The `scripts` directory contains scripts for initializing and configuring the self-hosted agent.

- `init-self-hosted-agent.sh`: Initializes the self-hosted agent setup.
- `configure-agent.ps1`: Configures the self-hosted agent for CI/CD pipelines.

## Architecture

For detailed architecture documentation, refer to `docs/architecture.md`.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.