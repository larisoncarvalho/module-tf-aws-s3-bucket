resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = {
    Name = "${var.name}-${each.key}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.name
  }
}

resource "aws_route_table" "this" {
  for_each = var.route_tables

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-${each.key}"
  }
}

resource "aws_route" "this" {
  for_each = var.routes

  route_table_id         = aws_route_table.this[each.value.route_table_key].id
  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = each.value.gateway_id == "igw" ? aws_internet_gateway.this.id : each.value.gateway_id
}

resource "aws_route_table_association" "this" {
  for_each = var.route_table_associations

  subnet_id      = aws_subnet.this[each.value.subnet_key].id
  route_table_id = aws_route_table.this[each.value.route_table_key].id
}

resource "aws_main_route_table_association" "this" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.this[var.main_route_table_key].id
}

resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.name}-default"
  }
}