resource "aws_subnet" "main" {
  availability_zone       = var.availability_zone
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  tags                    = var.tags
}