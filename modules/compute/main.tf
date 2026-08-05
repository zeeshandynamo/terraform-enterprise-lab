resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.bastion_security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = merge(var.common_tags, {
    Name = var.bastion_name
  })
}

resource "aws_instance" "private_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = false

  tags = merge(var.common_tags, {
    Name = var.private_server_name
  })
}

resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id
  instance_type          = var.jenkins_instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.jenkins_security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = merge(var.common_tags, {
    Name = var.jenkins_server_name
  })
}
