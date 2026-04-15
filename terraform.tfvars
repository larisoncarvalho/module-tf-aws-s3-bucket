region = "eu-central-1"

neha_private_runner_asg = {
  name                                  = "Neha_Private_Runner-private-runner-asg"
  availability_zones                    = ["eu-central-1a"]
  default_cooldown                      = 300
  desired_capacity                      = 1
  health_check_grace_period             = 300
  health_check_type                     = "EC2"
  max_size                              = 3
  min_size                              = 1
  new_instances_protected_from_scale_in = false
  service_linked_role_arn               = "arn:aws:iam::790543352839:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  termination_policies                  = ["Default"]
  vpc_zone_identifier                   = "subnet-0b77c0d76befaf70d"
  launch_template_id                    = "lt-04a98ee86f4d3061b"
  launch_template_version               = "$Latest"
}

ec2_instances = {
  instance_1 = {
    ami                         = "ami-074dd8e8dac7651a5"
    instance_type               = "t3.micro"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-thz89qha"
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids      = ["sg-057053456dac1810d"]
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
  instance_2 = {
    ami                         = "ami-027066fb16fc18634"
    instance_type               = "t3.micro"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-16n94g2h"
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids      = ["sg-0d603d8148b0d5ac9"]
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
  instance_3 = {
    ami                         = "ami-027066fb16fc18634"
    instance_type               = "t3.micro"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-ss7d1dui"
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids      = ["sg-046e1d25a31f2da72"]
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
  instance_4 = {
    ami                         = "ami-074dd8e8dac7651a5"
    instance_type               = "t3.micro"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-rrkft82d"
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids      = ["sg-0facee1eb713f09f4"]
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
}