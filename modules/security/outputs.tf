output "bastion_security_group_id" {
  value = aws_security_group.bastion_sg.id
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
}

output "jenkins_security_group_id" {
  value = var.create_jenkins ? aws_security_group.jenkins_sg[0].id : null
}

output "vault_security_group_id" {
  value = var.create_vault ? aws_security_group.vault_sg[0].id : null
}
