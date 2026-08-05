# 🚀 Terraform Enterprise Lab

A production-style Terraform project demonstrating how to manage existing AWS infrastructure using Infrastructure as Code (IaC), migrate Terraform state to a remote backend, and refactor a flat Terraform project into reusable modules without recreating infrastructure.

---

# 📌 Project Overview

This project demonstrates enterprise Terraform workflows rather than simply provisioning new infrastructure.

The infrastructure was first created on AWS and then brought under Terraform management by importing existing resources into the Terraform state. The project was later migrated from a local backend to a remote S3 backend with DynamoDB state locking and finally refactored into reusable Terraform modules.

This workflow closely resembles how many organizations adopt Infrastructure as Code for existing cloud environments.

---

# 🏗️ Architecture

```
                     Internet
                         │
                  Internet Gateway
                         │
                 Public Route Table
                         │
                 Public Subnet
                         │
                 Bastion Host
                         │
                    NAT Gateway
                         │
                Private Route Table
                         │
                Private Subnet
                         │
                 Private EC2 Server
```

---

# 📁 Project Structure

```
terraform-enterprise-lab/
│
├── backend.tf
├── providers.tf
├── versions.tf
├── variables.tf
├── locals.tf
├── data.tf
├── outputs.tf
├── main.tf
│
├── modules/
│   ├── network/
│   ├── security/
│   └── compute/
│
└── legacy-root/
```

---

# ⚙️ AWS Resources Managed

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Route Table Associations
- Bastion Host
- Private EC2 Server
- Security Groups

---

# 📦 Terraform Modules

## Network Module

Responsible for:

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Elastic IP
- NAT Gateway
- Route Tables
- Route Table Associations

---

## Security Module

Responsible for:

- Bastion Security Group
- Private Server Security Group

---

## Compute Module

Responsible for:

- Bastion EC2 Instance
- Private EC2 Instance

---

# 🔒 Remote Backend

Terraform state is stored remotely using:

- Amazon S3
- Versioning Enabled
- Server Side Encryption (AES256)
- DynamoDB State Locking

Benefits:

- Shared state
- State locking
- Version history
- Team collaboration
- Safer deployments

---

# 🔄 Existing Infrastructure Import

This project demonstrates importing existing AWS resources into Terraform.

Resources were imported using:

```bash
terraform import
```

instead of creating them from scratch.

---

# 🔄 Terraform State Migration

The project also demonstrates refactoring Terraform without rebuilding infrastructure.

Terraform state was migrated using:

```bash
terraform state mv
```

This allowed the infrastructure to be reorganized into reusable modules without destroying or recreating AWS resources.

---

# 🏷️ Common Tags

All resources use standardized tags.

```text
Project
Environment
ManagedBy
Owner
```

---

# 🛠️ Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS S3
- AWS DynamoDB
- Git
- GitHub

---

# 🎯 Key Learning Outcomes

- Infrastructure as Code (IaC)
- Terraform State Management
- Terraform Import
- Terraform State Migration
- Remote Backend Configuration
- Terraform Modules
- AWS Networking
- Enterprise Project Structure
- Infrastructure Refactoring

---

# 🚀 Future Enhancements

- Terraform Workspaces
- Environment Separation (Dev / UAT / Prod)
- Jenkins Integration
- HashiCorp Vault Integration
- Terraform Cloud / Enterprise
- CI/CD Pipeline
- Automated Validation

---

# 👨‍💻 Author

**Zeeshan Ali**

DevOps Engineer | Cloud | Terraform | AWS | CI/CD | Kubernetes
