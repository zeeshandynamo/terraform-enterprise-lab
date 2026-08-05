variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "bastion_sg_name" {
  description = "Bastion Security Group Name"
  type        = string
}

variable "private_sg_name" {
  description = "Private Security Group Name"
  type        = string
}

variable "jenkins_sg_name" {
  description = "Jenkins Security Group Name"
  type        = string
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs allowed to SSH into the bastion"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
