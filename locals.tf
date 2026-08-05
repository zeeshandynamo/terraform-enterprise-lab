####################################
# Local Values
####################################

locals {

  ####################################
  # Current Workspace
  ####################################

  environment = terraform.workspace

  ####################################
  # Resource Naming
  ####################################

  resource_prefix = "${var.project_name}-${local.environment}"

  ####################################
  # Workspace Specific Instance Types
  ####################################

  instance_types = {
    default = "t3.micro"
    dev     = "t3.micro"
    uat     = "t3.small"
    prod    = "t3.large"
  }

  ####################################
  # Common Tags
  ####################################

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = "Zeeshan Ali"
  }

}
