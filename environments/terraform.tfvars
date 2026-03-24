region = "eu-central-1"

vpc_id = "vpc-0e0a69ec93dc11ae9"

subnets = {
  sg_test_private_eu_central_1a = {
    availability_zone           = "eu-central-1a"
    cidr_block                  = "10.0.110.0/24"
    map_public_ip_on_launch     = false
    tags = {
      Name = "sg-test-private-eu-central-1a"
    }
  }
  sg_test_public_eu_central_1b = {
    availability_zone           = "eu-central-1b"
    cidr_block                  = "10.0.2.0/24"
    map_public_ip_on_launch     = true
    tags = {
      Name = "sg-test-public-eu-central-1b"
    }
  }
}