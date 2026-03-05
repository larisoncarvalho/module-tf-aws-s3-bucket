module "ec2_instances" {
  source   = "./modules/ec2_instance"
  for_each = var.ec2_instances

  ami_id                             = each.value.ami_id
  availability_zone                  = each.value.availability_zone
  capacity_reservation_preference    = each.value.capacity_reservation_preference
  ebs_optimized                      = each.value.ebs_optimized
  enclave_enabled                    = each.value.enclave_enabled
  hibernation                        = each.value.hibernation
  instance_type                      = each.value.instance_type
  key_name                           = each.value.key_name
  metadata_http_endpoint             = each.value.metadata_http_endpoint
  metadata_http_put_response_hop_limit = each.value.metadata_http_put_response_hop_limit
  metadata_http_tokens               = each.value.metadata_http_tokens
  metadata_instance_metadata_tags    = each.value.metadata_instance_metadata_tags
  monitoring                         = each.value.monitoring
  root_delete_on_termination         = each.value.root_delete_on_termination
  source_dest_check                  = each.value.source_dest_check
  subnet_id                          = each.value.subnet_id
  tenancy                            = each.value.tenancy
  vpc_security_group_ids             = each.value.vpc_security_group_ids
}