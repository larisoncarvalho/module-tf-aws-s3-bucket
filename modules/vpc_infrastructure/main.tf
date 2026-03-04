resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_1a" {
  availability_zone       = var.availability_zone_a
  cidr_block              = var.public_subnet_1a_cidr
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "subnetname1"
  }
}

resource "aws_subnet" "public_1b" {
  availability_zone       = var.availability_zone_b
  cidr_block              = var.public_subnet_1b_cidr
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "subnetname2"
  }
}

resource "aws_subnet" "private_1a" {
  availability_zone       = var.availability_zone_a
  cidr_block              = var.private_subnet_1a_cidr
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "privatesubnetname1"
  }
}

resource "aws_subnet" "private_1b" {
  availability_zone       = var.availability_zone_b
  cidr_block              = var.private_subnet_1b_cidr
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "privatesubnetname2"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-public"
  }
}

resource "aws_route" "public_internet_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
  route_table_id         = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1a.id
}

resource "aws_route_table_association" "public_1b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1b.id
}

resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-${var.availability_zone_a}"
  }
}

resource "aws_route_table_association" "private_1a" {
  route_table_id = aws_route_table.private_1a.id
  subnet_id      = aws_subnet.private_1a.id
}

resource "aws_route_table" "private_1b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-${var.availability_zone_b}"
  }
}

resource "aws_route_table_association" "private_1b" {
  route_table_id = aws_route_table.private_1b.id
  subnet_id      = aws_subnet.private_1b.id
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  tags = {
    Name = "${var.vpc_name}-default"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-default"
  }
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id

  subnet_ids = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1b.id,
    aws_subnet.private_1a.id,
    aws_subnet.private_1b.id,
  ]

  ingress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }

  ingress {
    action          = "allow"
    from_port       = 0
    ipv6_cidr_block = "::/0"
    protocol        = "-1"
    rule_no         = 101
    to_port         = 0
  }

  egress {
    action          = "allow"
    cidr_block      = "0.0.0.0/0"
    from_port       = 0
    protocol        = "-1"
    rule_no         = 100
    to_port         = 0
  }

  egress {
    action          = "allow"
    from_port       = 0
    ipv6_cidr_block = "::/0"
    protocol        = "-1"
    rule_no         = 101
    to_port         = 0
  }

  tags = {
    Name = "${var.vpc_name}-default"
  }
}