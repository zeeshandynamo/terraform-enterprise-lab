resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.bastion_security_group_id]
  key_name                    = var.key_name
  iam_instance_profile        = var.bastion_instance_profile_name
  associate_public_ip_address = true

  tags = merge(var.common_tags, {
    Name = var.bastion_name
  })
}

resource "aws_instance" "private_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  tags = merge(var.common_tags, {
    Name = var.private_server_name
  })
}

resource "aws_instance" "jenkins_server" {
  count                       = var.create_jenkins ? 1 : 0
  ami                         = var.ami_id
  instance_type               = var.jenkins_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.jenkins_security_group_id]
  key_name                    = var.key_name
  iam_instance_profile        = var.jenkins_instance_profile_name
  associate_public_ip_address = true

  tags = merge(var.common_tags, {
    Name = var.jenkins_server_name
  })
}

resource "aws_instance" "vault_server" {
  count                       = var.create_vault ? 1 : 0
  ami                         = var.ami_id
  instance_type               = var.vault_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.vault_security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(var.common_tags, {
    Name = var.vault_server_name
  })
}
