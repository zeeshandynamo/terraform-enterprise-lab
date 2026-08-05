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
  value = aws_instance.jenkins_server.public_ip
}

output "jenkins_private_ip" {
  value = aws_instance.jenkins_server.private_ip
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "private_server_instance_id" {
  value = aws_instance.private_server.id
}

output "jenkins_instance_id" {
  value = aws_instance.jenkins_server.id
}
