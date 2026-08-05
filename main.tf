module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone

  enable_dns_hostnames = true

  vpc_name                 = "terraform-lab-vpc1"
  public_subnet_name       = "public-subnet1"
  private_subnet_name      = "private-subnet1"
  internet_gateway_name    = "terraform-igw1"
  eip_name                 = "terraform-eip1"
  nat_gateway_name         = "terraform-nat1"
  public_route_table_name  = "public-route-table1"
  private_route_table_name = "private-route-table1"

  common_tags = local.common_tags
}

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id

  bastion_sg_name = "bastion-sg1"
  private_sg_name = "private-sg1"

  ssh_allowed_cidrs = ["0.0.0.0/0"]

  common_tags = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  bastion_security_group_id = module.security.bastion_security_group_id
  private_security_group_id = module.security.private_security_group_id

  bastion_name        = "bastion-host1"
  private_server_name = "private-server1"

  common_tags = local.common_tags
}
