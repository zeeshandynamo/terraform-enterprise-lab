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
  # Common Tags
  ####################################

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = "Zeeshan Ali"
  }

}
