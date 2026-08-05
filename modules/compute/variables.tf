variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "jenkins_instance_type" {
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

variable "bastion_name" {
  type = string
}

variable "private_server_name" {
  type = string
}

variable "jenkins_server_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
