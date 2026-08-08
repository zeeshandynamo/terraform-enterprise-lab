# Terraform Enterprise Lab

> Enterprise-grade AWS Infrastructure as Code using **Terraform**,
> **HashiCorp Vault**, **Jenkins**, **IAM Roles**, and a modular
> architecture.

## Overview

Terraform Enterprise Lab is a portfolio project demonstrating how a
modern DevOps team provisions and manages AWS infrastructure using
Infrastructure as Code (IaC). The project emphasizes security,
modularity, automation, and enterprise design patterns rather than
simply creating cloud resources.

The infrastructure provides:

-   Modular Terraform architecture
-   Multi-environment configuration (dev / uat / prod)
-   Custom VPC networking
-   Public and private subnets
-   Internet Gateway and NAT Gateway
-   Bastion host
-   Private application server
-   Jenkins CI/CD server
-   HashiCorp Vault server
-   IAM Roles for EC2
-   Secure secret management
-   Foundation for Ansible, Kubernetes and CI/CD

------------------------------------------------------------------------

# Architecture

``` text
                       GitHub
                          │
                     Webhook Push
                          │
                          ▼
                     Jenkins Server
                          │
              ┌───────────┴───────────┐
              │                       │
              ▼                       ▼
      HashiCorp Vault          AWS IAM Role
              │                       │
      GitHub PAT (KV v2)      Temporary Credentials
              │                       │
              └───────────┬───────────┘
                          ▼
                     Terraform Apply
                          │
             ┌────────────┴────────────┐
             ▼                         ▼
         AWS Infrastructure      Future Ansible
                          │
     ┌───────────────┬───────────────┬───────────────┐
     ▼               ▼               ▼               ▼
 Bastion         Jenkins         Vault         Private Server
```

------------------------------------------------------------------------

# Technology Stack

  Category            Technologies
  ------------------- --------------------
  Cloud               AWS
  IaC                 Terraform
  Secrets             HashiCorp Vault
  CI/CD               Jenkins
  Authentication      IAM Roles, AppRole
  OS                  Ubuntu Server
  Version Control     Git, GitHub
  Future Automation   Ansible

------------------------------------------------------------------------

# Features

-   Modular Terraform project
-   Reusable modules
-   Multi-environment support
-   Secure IAM Role authentication
-   Jenkins integrated with Vault
-   GitHub PAT stored in Vault
-   No AWS access keys on Jenkins
-   No AWS access keys on Bastion
-   Enterprise-ready folder structure
-   Separate network, security, compute and IAM modules

------------------------------------------------------------------------

# Infrastructure Components

## Network

-   VPC
-   Public Subnet
-   Private Subnet
-   Internet Gateway
-   NAT Gateway
-   Public Route Table
-   Private Route Table

## Security

-   Bastion Security Group
-   Jenkins Security Group
-   Vault Security Group
-   Private Server Security Group

## Compute

-   Bastion Host
-   Jenkins Server
-   Vault Server
-   Private Server

## IAM

-   Jenkins IAM Role
-   Jenkins Instance Profile
-   Bastion IAM Role
-   Bastion Instance Profile
-   AdministratorAccess (Lab)

------------------------------------------------------------------------

# Terraform Modules

    modules/
    ├── network/
    ├── security/
    ├── compute/
    └── iam/

## Network Module

Creates networking resources including VPC, subnets, gateways and
routing.

## Security Module

Creates security groups for each server.

## Compute Module

Creates EC2 instances and attaches IAM Instance Profiles.

## IAM Module

Creates IAM Roles, Instance Profiles and Policy Attachments.

------------------------------------------------------------------------

# Folder Structure

``` text
terraform-enterprise-lab/
│
├── modules/
│   ├── network/
│   ├── security/
│   ├── compute/
│   └── iam/
│
├── environments/
│   ├── dev.tfvars
│   ├── uat.tfvars
│   └── prod.tfvars
│
├── backend.tf
├── providers.tf
├── versions.tf
├── locals.tf
├── variables.tf
├── outputs.tf
├── main.tf
├── data.tf
├── README.md
└── .gitignore
```

------------------------------------------------------------------------

# Authentication Design

## AWS Authentication

The project uses IAM Roles instead of long-lived AWS Access Keys.

### Bastion

-   IAM Role attached
-   Temporary AWS credentials
-   No local credentials

### Jenkins

-   IAM Role attached
-   Uses EC2 Instance Metadata Service (IMDS)
-   No `aws configure`

------------------------------------------------------------------------

# Vault Authentication

Vault stores sensitive secrets.

Secrets include:

-   GitHub Personal Access Token

Authentication:

-   AppRole
-   Role ID
-   Secret ID

Jenkins authenticates to Vault using AppRole and retrieves secrets
dynamically during pipeline execution.

------------------------------------------------------------------------

# Deployment Workflow

1.  Clone repository
2.  Configure backend (optional)
3.  Initialize Terraform
4.  Select workspace
5.  Apply environment variables
6.  Provision infrastructure
7.  Install Jenkins
8.  Configure Vault
9.  Configure IAM Roles
10. Verify authentication

Example:

``` bash
terraform init
terraform workspace select dev
terraform plan -var-file=environments/dev.tfvars
terraform apply -var-file=environments/dev.tfvars
```

------------------------------------------------------------------------

# Verification

## Terraform

``` bash
terraform validate
terraform plan
terraform apply
```

## Jenkins IAM

``` bash
aws sts get-caller-identity
```

Expected:

    assumed-role/terraform-enterprise-lab-dev-jenkins-role

## Bastion IAM

``` bash
aws sts get-caller-identity
```

Expected:

    assumed-role/terraform-enterprise-lab-dev-bastion-role

## Vault

``` bash
vault status
vault kv get secret/github
```

------------------------------------------------------------------------

# Security Best Practices

-   Modular Terraform design
-   IAM Roles instead of static credentials
-   Secrets stored in Vault
-   AppRole authentication
-   Public/private subnet separation
-   Security Groups
-   NAT Gateway for private outbound traffic
-   Infrastructure defined as code
-   Version-controlled modules

------------------------------------------------------------------------

# Future Enhancements

-   Ansible Configuration Management
-   Docker automation
-   Kubernetes deployment
-   Prometheus & Grafana
-   EFK logging
-   GitHub Actions
-   Terraform Cloud backend
-   Least-Privilege IAM policies
-   Auto Scaling
-   Application Load Balancer

------------------------------------------------------------------------

# Skills Demonstrated

-   Infrastructure as Code
-   AWS Networking
-   Terraform Modules
-   IAM
-   EC2
-   VPC
-   Security Groups
-   NAT Gateway
-   Route Tables
-   HashiCorp Vault
-   Jenkins
-   Secret Management
-   CI/CD Foundations
-   Multi-environment Infrastructure
-   DevOps Best Practices

------------------------------------------------------------------------

# Author

**Zeeshan Ali**

DevOps Engineer

This project was built as an enterprise-style learning and portfolio
project demonstrating secure Infrastructure as Code, cloud automation,
and CI/CD foundations.

