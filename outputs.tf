####################################
# Network Outputs
####################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "Private Subnet ID"
  value       = module.network.private_subnet_id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.network.nat_gateway_id
}

####################################
# Compute Outputs
####################################

output "bastion_public_ip" {
  description = "Public IP of Bastion Host"
  value       = module.compute.bastion_public_ip
}

output "bastion_private_ip" {
  description = "Private IP of Bastion Host"
  value       = module.compute.bastion_private_ip
}

output "private_server_private_ip" {
  description = "Private IP of Private Server"
  value       = module.compute.private_server_private_ip
}

output "jenkins_public_ip" {
  description = "Public IP of Jenkins Server"
  value       = module.compute.jenkins_public_ip
}

output "jenkins_private_ip" {
  description = "Private IP of Jenkins Server"
  value       = module.compute.jenkins_private_ip
}

output "vault_public_ip" {
  description = "Public IP of Vault Server"
  value       = module.compute.vault_public_ip
}

output "vault_private_ip" {
  description = "Private IP of Vault Server"
  value       = module.compute.vault_private_ip
}

####################################
# Instance IDs
####################################

output "bastion_instance_id" {
  value = module.compute.bastion_instance_id
}

output "private_server_instance_id" {
  value = module.compute.private_server_instance_id
}

output "jenkins_instance_id" {
  value = module.compute.jenkins_instance_id
}

output "vault_instance_id" {
  value = module.compute.vault_instance_id
}
