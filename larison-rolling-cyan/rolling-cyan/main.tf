module "sg_vpc_jkdsbfkjdsabv_default" {
  source = "./modules/route_table"

  vpc_id = var.vpc_id_sg_vpc_jkdsbfkjdsabv
  tags   = { Name = "sg-vpc-jkdsbfkjdsabv-default" }
  routes = {}
}

module "sg_vpc_2_default" {
  source = "./modules/route_table"

  vpc_id = var.vpc_id_sg_vpc_2
  tags   = { Name = "sg-vpc-2-default" }
  routes = {}
}