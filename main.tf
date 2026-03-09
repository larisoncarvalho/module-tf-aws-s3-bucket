module "ec2_instances" {
  source   = "./modules/ec2_instance"
  for_each = var.ec2_instances

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  availability_zone           = each.value.availability_zone
  key_name                    = each.value.key_name
  vpc_security_group_ids      = each.value.vpc_security_group_ids
  subnet_id                   = each.value.subnet_id
  associate_public_ip_address = each.value.associate_public_ip_address
  source_dest_check           = each.value.source_dest_check
  ebs_optimized               = each.value.ebs_optimized
  monitoring                  = each.value.monitoring
  tenancy                     = each.value.tenancy
}