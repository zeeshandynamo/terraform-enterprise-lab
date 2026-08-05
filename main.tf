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

  enable_dns_hostnames = true

  ####################################
  # Workspace Aware Resource Names
  ####################################

  vpc_name                 = "${local.resource_prefix}-vpc"
  public_subnet_name       = "${local.resource_prefix}-public-subnet"
  private_subnet_name      = "${local.resource_prefix}-private-subnet"
  internet_gateway_name    = "${local.resource_prefix}-igw"
  eip_name                 = "${local.resource_prefix}-eip"
  nat_gateway_name         = "${local.resource_prefix}-nat"
  public_route_table_name  = "${local.resource_prefix}-public-rt"
  private_route_table_name = "${local.resource_prefix}-private-rt"

  ####################################
  # Common Tags
  ####################################

  common_tags = local.common_tags
}

####################################
# Security Module
####################################

module "security" {
  source = "./modules/security"

  ####################################
  # Dependencies
  ####################################

  vpc_id = module.network.vpc_id

  ####################################
  # Workspace Aware Names
  ####################################

  bastion_sg_name = "${local.resource_prefix}-bastion-sg"
  private_sg_name = "${local.resource_prefix}-private-sg"

  ####################################
  # Security Rules
  ####################################

  ssh_allowed_cidrs = ["0.0.0.0/0"]

  ####################################
  # Common Tags
  ####################################

  common_tags = local.common_tags
}

####################################
# Compute Module
####################################

module "compute" {
  source = "./modules/compute"

  ####################################
  # EC2 Configuration
  ####################################

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = local.instance_types[local.environment]
  key_name      = var.key_pair_name

  ####################################
  # Networking
  ####################################

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  ####################################
  # Security Groups
  ####################################

  bastion_security_group_id = module.security.bastion_security_group_id
  private_security_group_id = module.security.private_security_group_id

  ####################################
  # Workspace Aware Names
  ####################################

  bastion_name        = "${local.resource_prefix}-bastion"
  private_server_name = "${local.resource_prefix}-private-server"

  ####################################
  # Common Tags
  ####################################

  common_tags = local.common_tags
}
