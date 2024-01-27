resource "aws_vpc" "public-vpc" {
  cidr_block           = local.cidr_block["vpc"] # getting the value of the key "vpc" from the cidr_block map
  enable_dns_hostnames = local.positive
  enable_dns_support   = local.positive
}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.public-vpc.id
  cidr_block        = local.cidr_block["subnet"] # getting the value of the key "subnet" from the cidr_block map
  availability_zone = local.azs
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.public-vpc.id
}

resource "aws_route_table" "default-routes" {
  vpc_id = aws_vpc.public-vpc.id
  route {
    cidr_block = local.general_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "route-associations" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.default-routes.id
}


