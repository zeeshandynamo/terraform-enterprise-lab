####################################
# Bastion Security Group
####################################

resource "aws_security_group" "bastion_sg" {

  name        = "bastion-sg1"
  description = "Security group for Bastion Host"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from Internet"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-bastion-sg"
    }
  )

}

####################################
# Private Server Security Group
####################################

resource "aws_security_group" "private_sg" {

  name        = "private-sg1"
  description = "Security group for Private Server"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "SSH from Bastion"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = [
      aws_security_group.bastion_sg.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-private-sg"
    }
  )

}
