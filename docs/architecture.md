# Architecture Overview

This document provides an overview of the architecture for the Azure infrastructure deployed using the Terraform module. The architecture follows a Hub and Spoke network topology, which is a common design pattern for organizing Azure resources.

## Key Components

1. **Resource Group**
   - A dedicated Azure Resource Group is created to contain all the resources for the deployment. This helps in managing and organizing resources effectively.

2. **Hub and Spoke Network Topology**
   - The architecture includes a Hub VNet that acts as the central point for connectivity and multiple Spoke VNets that can be used for different applications or environments.
   - Each VNet is configured with appropriate address spaces and subnets to isolate resources and manage traffic.

3. **Network Security Groups (NSGs)**
   - NSGs are created to control inbound and outbound traffic to the VNets and subnets. Security rules are defined to ensure that only allowed traffic can flow to and from the resources.

4. **Virtual Machines**
   - Two Virtual Machines are provisioned within the VNets. These VMs can be used for various purposes, such as hosting applications or services.
   - Each VM is configured with public IPs for external access and appropriate sizes based on the workload requirements.

5. **Self-Hosted Agent for CI/CD**
   - A self-hosted agent is set up to facilitate CI/CD pipelines, allowing for automated deployments and integrations with tools like GitHub Actions or Azure DevOps.
   - The agent is configured to run on one of the VMs, ensuring that it has the necessary resources and network access.

## Architecture Diagram

[Insert Architecture Diagram Here]

## Deployment Flow

1. **Initialize Terraform**
   - Run `terraform init` to initialize the Terraform configuration and download necessary providers.

2. **Plan the Deployment**
   - Execute `terraform plan` to review the resources that will be created.

3. **Apply the Configuration**
   - Use `terraform apply` to deploy the infrastructure as defined in the Terraform modules.

4. **Configure Self-Hosted Agent**
   - After the infrastructure is deployed, run the initialization script to set up the self-hosted agent.

## Conclusion

This architecture provides a scalable and secure foundation for deploying applications in Azure. The Hub and Spoke topology allows for efficient resource management and isolation, while the self-hosted agent enables continuous integration and delivery practices.