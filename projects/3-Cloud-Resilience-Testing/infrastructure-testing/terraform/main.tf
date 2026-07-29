provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "resilience-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "resilience-vpc"
  }
}

resource "aws_subnet" "resilience-subnet" {
  vpc_id     = aws_vpc.resilience-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "resilience-subnet"
  }
}

resource "aws_internet_gateway" "resilience-igw" {
  vpc_id = aws_vpc.resilience-vpc.id
  tags = {
    Name = "resilience-igw"
  }
}

resource "aws_route_table" "resilience-route-table" {
  vpc_id = aws_vpc.resilience-vpc.id
  tags = {
    Name = "resilience-route-table"
  }
}

resource "aws_route_table_association" "resilience-association" {
  subnet_id      = aws_subnet.resilience-subnet.id
  route_table_id = aws_route_table.resilience-route-table.id
}