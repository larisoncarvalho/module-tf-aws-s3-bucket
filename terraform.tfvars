region = "eu-central-1"

ec2_instances = {
  instance_1 = {
    ami_id                             = "ami-0242293c1166ee926"
    instance_type                      = "t3.medium"
    availability_zone                  = "eu-central-1a"
    key_name                           = "packer_68c879f2-1468-642a-6776-a06c2a3c37fc"
    subnet_id                          = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids             = ["sg-04211bd5ce13e32c0"]
    source_dest_check                  = true
    ebs_optimized                      = false
    monitoring                         = false
    tenancy                            = "default"
    hibernation                        = false
    enclave_enabled                    = false
    metadata_http_endpoint             = "enabled"
    metadata_http_tokens               = "optional"
    metadata_http_put_response_hop_limit = 1
    metadata_instance_metadata_tags    = "disabled"
    capacity_reservation_preference    = "none"
    root_delete_on_termination         = true
  }
  instance_2 = {
    ami_id                             = "ami-074dd8e8dac7651a5"
    instance_type                      = "t3.micro"
    availability_zone                  = "eu-central-1a"
    key_name                           = "ec2-key-thz89qha"
    subnet_id                          = "subnet-0b77c0d76befaf70d"
    vpc_security_group_ids             = ["sg-057053456dac1810d"]
    source_dest_check                  = true
    ebs_optimized                      = false
    monitoring                         = false
    tenancy                            = "default"
    hibernation                        = false
    enclave_enabled                    = false
    metadata_http_endpoint             = "enabled"
    metadata_http_tokens               = "optional"
    metadata_http_put_response_hop_limit = 1
    metadata_instance_metadata_tags    = "disabled"
    capacity_reservation_preference    = "open"
    root_delete_on_termination         = true
  }
}