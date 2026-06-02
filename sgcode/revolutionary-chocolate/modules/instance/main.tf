resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = var.vpc_instance_tenancy

  tags = {
    Name          = var.vpc_name
    Resource-Type = var.vpc_resource_type
  }
}

resource "aws_subnet" "this" {
  assign_ipv6_address_on_creation = var.subnet_assign_ipv6_address_on_creation
  availability_zone               = var.availability_zone
  cidr_block                      = var.subnet_cidr_block
  ipv6_cidr_block                 = var.subnet_ipv6_cidr_block
  map_public_ip_on_launch         = var.subnet_map_public_ip_on_launch
  vpc_id                          = aws_vpc.this.id

  tags = {
    Name          = var.subnet_name
    Resource-Type = var.subnet_resource_type
  }
}

resource "aws_security_group" "this" {
  description = var.security_group_description
  name        = var.security_group_name
  vpc_id      = aws_vpc.this.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  egress {
    from_port        = 0
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "-1"
    to_port          = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  availability_zone      = var.availability_zone
  ebs_optimized          = var.ebs_optimized
  instance_type          = var.instance_type
  key_name               = aws_key_pair.this.key_name
  monitoring             = var.monitoring
  source_dest_check      = var.source_dest_check
  subnet_id              = aws_subnet.this.id
  tenancy                = var.tenancy
  vpc_security_group_ids = [aws_security_group.this.id]

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
    http_tokens                 = var.metadata_http_tokens
  }

  root_block_device {
    delete_on_termination = var.root_volume_delete_on_termination
    encrypted             = var.root_volume_encrypted
    iops                  = var.root_volume_iops
    throughput            = var.root_volume_throughput
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
  }

  tags = {
    Name = var.instance_name
  }
}