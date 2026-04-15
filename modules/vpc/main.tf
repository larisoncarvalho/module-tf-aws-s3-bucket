resource "aws_vpc" "this" {
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  tags                             = var.tags
}