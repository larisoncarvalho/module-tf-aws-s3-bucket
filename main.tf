module "instance" {
  source = "./modules/instance"

  instances = var.instances
}