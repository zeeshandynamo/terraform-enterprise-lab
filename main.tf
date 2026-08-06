####################################
# Root Module
####################################

module "network" {
  source = "./modules/network"

  ####################################
  # Networking
  ####################################

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone

  # Keep the same as existing infrastructure
  enable_dns_hostnames = false

  ####################################
  # Existing Resource Names
  ####################################

  vpc_name                 = var.vpc_name
  public_subnet_name       = var.public_subnet_name
  private_subnet_name      = var.private_subnet_name
  internet_gateway_name    = var.internet_gateway_name
  eip_name                 = var.eip_name
  nat_gateway_name         = var.nat_gateway_name
  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name

  common_tags = local.common_tags
}

####################################
# Security Module
####################################

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id

  bastion_sg_name = var.bastion_sg_name
  private_sg_name = var.private_sg_name

  # New resources
  jenkins_sg_name = "${local.resource_prefix}-jenkins-sg"
  vault_sg_name   = "${local.resource_prefix}-vault-sg"

  ssh_allowed_cidrs = ["0.0.0.0/0"]

  common_tags = local.common_tags

  create_jenkins = local.create_jenkins
  create_vault   = local.create_vault
}

####################################
# Compute Module
####################################

module "compute" {
  source = "./modules/compute"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  jenkins_instance_type = var.jenkins_instance_type
  vault_instance_type   = var.vault_instance_type

  key_name = var.key_pair_name

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  bastion_security_group_id = module.security.bastion_security_group_id
  private_security_group_id = module.security.private_security_group_id
  jenkins_security_group_id = module.security.jenkins_security_group_id
  vault_security_group_id   = module.security.vault_security_group_id

  jenkins_instance_profile_name = module.iam.jenkins_instance_profile_name
  bastion_instance_profile_name = module.iam.bastion_instance_profile_name

  bastion_name        = var.bastion_name
  private_server_name = var.private_server_name

  # New resource
  jenkins_server_name = "${local.resource_prefix}-jenkins"
  vault_server_name   = "${local.resource_prefix}-vault"

  common_tags = local.common_tags

  create_jenkins = local.create_jenkins
  create_vault   = local.create_vault
}

####################################
# IAM Module
####################################

module "iam" {
  source = "./modules/iam"

  role_name             = "${local.resource_prefix}-jenkins-role"
  instance_profile_name = "${local.resource_prefix}-jenkins-profile"

  bastion_role_name             = "${local.resource_prefix}-bastion-role"
  bastion_instance_profile_name = "${local.resource_prefix}-bastion-profile"
}
