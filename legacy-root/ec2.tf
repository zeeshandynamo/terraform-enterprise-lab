####################################
# Bastion Host
####################################

resource "aws_instance" "bastion" {

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-bastion"
    }
  )

}

####################################
# Private Server
####################################

resource "aws_instance" "private_server" {

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = var.key_pair_name

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-private-server"
    }
  )

}
