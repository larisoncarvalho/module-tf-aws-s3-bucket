resource "aws_subnet" "this" {
  availability_zone = var.availability_zone
  cidr_block        = var.cidr_block
  vpc_id            = var.vpc_id
}