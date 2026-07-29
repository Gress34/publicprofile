provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "platform-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "platform-vpc"
  }
}

resource "aws_subnet" "platform-subnet" {
  vpc_id     = aws_vpc.platform-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "platform-subnet"
  }
}

resource "aws_internet_gateway" "platform-igw" {
  vpc_id = aws_vpc.platform-vpc.id
  tags = {
    Name = "platform-igw"
  }
}

resource "aws_route_table" "platform-route-table" {
  vpc_id = aws_vpc.platform-vpc.id
  tags = {
    Name = "platform-route-table"
  }
}

resource "aws_route_table_association" "platform-association" {
  subnet_id      = aws_subnet.platform-subnet.id
  route_table_id = aws_route_table.platform-route-table.id
}