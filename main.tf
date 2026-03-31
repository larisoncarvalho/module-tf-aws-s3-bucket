module "azurenetwork" {
  source = "./modules/resource_group"

  location = "eastus"
  name     = "azurenetwork"
  tags = {
    app         = "azurenetwork"
    creator     = "stackgurdian"
    environment = "default"
  }
}

module "ec2_instance" {
  source = "./modules/instance"

  ami                                      = var.ami
  associate_public_ip_address              = true
  availability_zone                        = "eu-central-1a"
  capacity_reservation_preference          = "open"
  cpu_core_count                           = 1
  cpu_threads_per_core                     = 2
  ebs_optimized                            = false
  enclave_enabled                          = false
  hibernation                              = false
  instance_type                            = "t3.micro"
  key_name                                 = var.key_name
  metadata_http_endpoint                   = "enabled"
  metadata_http_put_response_hop_limit     = 1
  metadata_http_tokens                     = "optional"
  metadata_instance_metadata_tags          = "disabled"
  monitoring                               = false
  root_delete_on_termination               = true
  root_volume_type                         = "gp2"
  source_dest_check                        = true
  subnet_id                                = var.subnet_id
  tenancy                                  = "default"
  vpc_security_group_ids                   = var.vpc_security_group_ids
}