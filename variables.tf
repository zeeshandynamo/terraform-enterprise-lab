####################################
# Project Variables
####################################

variable "project_name" {
  description = "Project name"
  type        = string
}

####################################
# AWS Variables
####################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

####################################
# Network Variables
####################################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = string
}

####################################
# EC2 Variables
####################################

variable "instance_type" {
  description = "Application EC2 Instance Type"
  type        = string
}

variable "jenkins_instance_type" {
  description = "Jenkins EC2 Instance Type"
  type        = string
}

variable "key_pair_name" {
  description = "AWS Key Pair Name"
  type        = string
}

####################################
# Existing Compute Resource Names
####################################

variable "bastion_name" {
  type = string
}

variable "private_server_name" {
  type = string
}

variable "bastion_sg_name" {
  type = string
}

variable "private_sg_name" {
  type = string
}

####################################
# Existing Network Resource Names
####################################

variable "vpc_name" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "nat_gateway_name" {
  type = string
}

variable "eip_name" {
  type = string
}

variable "public_route_table_name" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

variable "vault_instance_type" {
  description = "Vault EC2 Instance Type"
  type        = string
}

variable "vault_server_name" {
  description = "Vault Server Name"
  type        = string
  default     = "vault-server"
}
