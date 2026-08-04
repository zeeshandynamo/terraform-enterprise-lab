####################################
# VPC Outputs
####################################

output "vpc_id" {

  description = "VPC ID"

  value = aws_vpc.main.id

}

####################################
# Subnet Outputs
####################################

output "public_subnet_id" {

  description = "Public Subnet ID"

  value = aws_subnet.public.id

}

output "private_subnet_id" {

  description = "Private Subnet ID"

  value = aws_subnet.private.id

}

####################################
# EC2 Outputs
####################################

output "bastion_public_ip" {

  description = "Public IP of Bastion Host"

  value = aws_instance.bastion.public_ip

}

output "private_server_private_ip" {

  description = "Private IP of Private Server"

  value = aws_instance.private_server.private_ip

}

####################################
# NAT Gateway
####################################

output "nat_gateway_id" {

  description = "NAT Gateway ID"

  value = aws_nat_gateway.nat.id

}
