variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "jenkins_instance_type" {
  type = string
}

variable "vault_instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "bastion_security_group_id" {
  type = string
}

variable "private_security_group_id" {
  type = string
}

variable "jenkins_security_group_id" {
  type = string
}

variable "vault_security_group_id" {
  type = string
}

variable "bastion_name" {
  type = string
}

variable "private_server_name" {
  type = string
}

variable "jenkins_server_name" {
  type = string
}

variable "vault_server_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "create_jenkins" {
  type = bool
}

variable "create_vault" {
  type = bool
}

variable "jenkins_instance_profile_name" {
  description = "IAM Instance Profile for Jenkins"
  type        = string
}

variable "bastion_instance_profile_name" {
  description = "IAM Instance Profile for Bastion"
  type        = string
}
