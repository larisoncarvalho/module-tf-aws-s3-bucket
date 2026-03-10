region = "eu-central-1"

ec2_instances = {
  instance_1 = {
    ami                         = "ami-0242293c1166ee926"
    instance_type               = "t3.medium"
    availability_zone           = "eu-central-1a"
    key_name                    = "packer_68c879f2-1468-642a-6776-a06c2a3c37fc"
    vpc_security_group_ids      = ["sg-04211bd5ce13e32c0"]
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    associate_public_ip_address = false
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
  instance_2 = {
    ami                         = "ami-074dd8e8dac7651a5"
    instance_type               = "t3.micro"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-thz89qha"
    vpc_security_group_ids      = ["sg-057053456dac1810d"]
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
  instance_3 = {
    ami                         = "ami-03b7a7ce915b46b75"
    instance_type               = "t3.medium"
    availability_zone           = "eu-central-1a"
    key_name                    = "ec2-key-09a43dgt"
    vpc_security_group_ids      = ["sg-04fe9eb743c23145a"]
    subnet_id                   = "subnet-0b77c0d76befaf70d"
    associate_public_ip_address = true
    source_dest_check           = true
    ebs_optimized               = false
    monitoring                  = false
    tenancy                     = "default"
  }
}