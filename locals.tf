####################################
# Local Values
####################################

locals {

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Zeeshan Ali"
  }

  resource_prefix = "${var.project_name}-${var.environment}"

}
