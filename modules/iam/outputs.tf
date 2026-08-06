####################################
# IAM Module Outputs
####################################

output "jenkins_role_name" {
  value = aws_iam_role.jenkins_role.name
}

output "jenkins_role_arn" {
  value = aws_iam_role.jenkins_role.arn
}

output "jenkins_instance_profile_name" {
  value = aws_iam_instance_profile.jenkins_profile.name
}

output "jenkins_instance_profile_arn" {
  value = aws_iam_instance_profile.jenkins_profile.arn
}

output "bastion_instance_profile_name" {
  value = aws_iam_instance_profile.bastion_profile.name
}

output "bastion_role_name" {
  value = aws_iam_role.bastion_role.name
}

output "bastion_role_arn" {
  value = aws_iam_role.bastion_role.arn
}
