####################################
# Temporary EC2 Instance
####################################

resource "aws_instance" "temporary_test" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = module.network.public_subnet_id
  vpc_security_group_ids = [module.security.private_security_group_id]
  key_name               = var.key_pair_name

  tags = {
    Name        = "${local.resource_prefix}-temporary-test"
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = "Zeeshan Ali"
  }
}
