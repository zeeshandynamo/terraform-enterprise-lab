variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "public_subnet_name" {
  description = "Public Subnet Name"
  type        = string
}

variable "private_subnet_name" {
  description = "Private Subnet Name"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

variable "eip_name" {
  description = "Elastic IP Name"
  type        = string
}

variable "nat_gateway_name" {
  description = "NAT Gateway Name"
  type        = string
}

variable "public_route_table_name" {
  description = "Public Route Table Name"
  type        = string
}

variable "private_route_table_name" {
  description = "Private Route Table Name"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
