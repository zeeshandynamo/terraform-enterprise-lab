output "bastion_security_group_id" {
  value = aws_security_group.bastion_sg.id
}

output "private_security_group_id" {
  value = aws_security_group.private_sg.id
}
