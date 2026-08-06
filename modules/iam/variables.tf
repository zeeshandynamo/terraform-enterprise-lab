####################################
# IAM Module Variables
####################################

variable "role_name" {
  description = "IAM Role Name"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

variable "bastion_role_name" {
  description = "IAM Role Name for Bastion"
  type        = string
}

variable "bastion_instance_profile_name" {
  description = "Instance Profile Name for Bastion"
  type        = string
}
