####################################
# Elastic IP
####################################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-eip"
    }
  )

}

####################################
# NAT Gateway
####################################

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-nat-gateway"
    }
  )

}

####################################
# Private Route
####################################

resource "aws_route" "private_internet_access" {

  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id

}
