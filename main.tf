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
  # Resource Names
  ####################################

  vpc_name                 = "${local.resource_prefix}-vpc"
  public_subnet_name       = "${local.resource_prefix}-public-subnet"
  private_subnet_name      = "${local.resource_prefix}-private-subnet"
  internet_gateway_name    = "${local.resource_prefix}-igw"
  eip_name                 = "${local.resource_prefix}-eip"
  nat_gateway_name         = "${local.resource_prefix}-nat"
  public_route_table_name  = "${local.resource_prefix}-public-rt"
  private_route_table_name = "${local.resource_prefix}-private-rt"

  common_tags = local.common_tags
}

####################################
# Security Module
####################################

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id

  bastion_sg_name = "${local.resource_prefix}-bastion-sg"
  private_sg_name = "${local.resource_prefix}-private-sg"
  jenkins_sg_name = "${local.resource_prefix}-jenkins-sg"

  ssh_allowed_cidrs = ["0.0.0.0/0"]

  common_tags = local.common_tags
}

####################################
# Compute Module
####################################

module "compute" {
  source = "./modules/compute"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  jenkins_instance_type = var.jenkins_instance_type

  key_name = var.key_pair_name

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  bastion_security_group_id = module.security.bastion_security_group_id
  private_security_group_id = module.security.private_security_group_id
  jenkins_security_group_id = module.security.jenkins_security_group_id

  bastion_name        = "${local.resource_prefix}-bastion"
  private_server_name = "${local.resource_prefix}-private-server"
  jenkins_server_name = "${local.resource_prefix}-jenkins"

  common_tags = local.common_tags
}
