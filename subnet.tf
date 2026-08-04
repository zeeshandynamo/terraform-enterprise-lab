####################################
# Public Subnet
####################################

resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-public-subnet"
      Type = "Public"
    }
  )

}

####################################
# Private Subnet
####################################

resource "aws_subnet" "private" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-private-subnet"
      Type = "Private"
    }
  )

}
