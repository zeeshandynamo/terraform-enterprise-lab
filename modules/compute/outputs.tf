output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  value = aws_instance.bastion.private_ip
}

output "private_server_private_ip" {
  value = aws_instance.private_server.private_ip
}

output "jenkins_public_ip" {
  value = var.create_jenkins ? aws_instance.jenkins_server[0].public_ip : null
}

output "jenkins_private_ip" {
  value = var.create_jenkins ? aws_instance.jenkins_server[0].private_ip : null
}

output "vault_public_ip" {
  value = var.create_vault ? aws_instance.vault_server[0].public_ip : null
}

output "vault_private_ip" {
  value = var.create_vault ? aws_instance.vault_server[0].private_ip : null
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "private_server_instance_id" {
  value = aws_instance.private_server.id
}

output "jenkins_instance_id" {
  value = var.create_jenkins ? aws_instance.jenkins_server[0].id : null
}

output "vault_instance_id" {
  value = var.create_vault ? aws_instance.vault_server[0].id : null
}
