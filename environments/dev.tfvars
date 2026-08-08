####################################
# Development Environment
####################################

# Project
project_name = "terraform-enterprise-lab"

# AWS
aws_region        = "ap-south-1"
availability_zone = "ap-south-1a"

# Key Pair
key_pair_name = "VPCC"

# Networking
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# EC2
instance_type         = "t3.micro"
jenkins_instance_type = "t3.medium"
vault_instance_type   = "t3.micro"

# Existing Compute Resource Names
bastion_name        = "bastion-host1"
private_server_name = "private-server1"

# Existing Security Group Names
bastion_sg_name = "bastion-sg1"
private_sg_name = "private-sg1"

# Existing Network Resource Names
vpc_name                 = "terraform-lab-vpc1"
public_subnet_name       = "public-subnet1"
private_subnet_name      = "private-subnet1"
internet_gateway_name    = "igw1"
nat_gateway_name         = "nat-gateway1"
eip_name                 = "nat-eip1"
public_route_table_name  = "public-route-table1"
private_route_table_name = "private-route-table1"
