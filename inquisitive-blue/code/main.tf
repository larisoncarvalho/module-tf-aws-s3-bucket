module "ext_approval_qa" {
  source = "./modules/ec2_instance"

  ami_id                               = "ami-00266546a4aac405e"
  instance_type                        = "t3.micro"
  availability_zone                    = "eu-central-1a"
  subnet_id                            = var.subnet_id
  security_group_ids                   = var.security_group_ids
  iam_instance_profile_arn             = var.iam_instance_profile_arn
  associate_public_ip_address          = true
  source_dest_check                    = true
  ebs_optimized                        = false
  monitoring                           = false
  tenancy                              = "default"
  hibernation                          = false
  enclave_enabled                      = false
  metadata_http_endpoint               = "enabled"
  metadata_http_tokens                 = "required"
  metadata_http_put_response_hop_limit = 2
  metadata_http_protocol_ipv6          = "disabled"
  metadata_instance_metadata_tags      = "disabled"
  root_volume_type                     = var.root_volume_type
  root_delete_on_termination           = true
  cpu_core_count                       = 1
  cpu_threads_per_core                 = 2
  capacity_reservation_preference      = "open"
  tags = {
    "Name"        = "ext-approval-qa"
    "Project"     = "sg-external-approval"
    "Environment" = "qa"
    "ManagedBy"   = "terraform"
  }
}