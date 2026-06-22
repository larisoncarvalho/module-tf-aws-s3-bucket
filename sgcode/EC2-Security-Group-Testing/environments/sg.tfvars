instances = {
  sg_created_test_instance = {
    ami                    = "ami-0ad7e15f9249e8d2f"
    instance_type          = "t3.micro"
    subnet_id              = "subnet-0adeb216161049cca"
    vpc_security_group_ids = ["sg-064cbb231ba1bca24"]
    availability_zone      = "eu-central-1a"
    source_dest_check      = true
    ebs_optimized          = false
    monitoring             = false
    tags = {
      Name = "sg-created-test-instance"
    }
  }
}

network_interfaces = {
  eni_0fef14b2c7dd7d059 = {
    subnet_id         = "subnet-0adeb216161049cca"
    security_groups   = ["sg-064cbb231ba1bca24"]
    private_ip        = "10.0.0.113"
    source_dest_check = true
    description       = ""
    tags              = {}
  }
}
