module "cloudformation_sg_1" {
  source = "./modules/cloudformation_stack"

  stack_name       = "Cloudformation-sg-1"
  capabilities     = ["CAPABILITY_IAM"]
  disable_rollback = false
  parameters = {
    PrivateSubnet1CIDR = "10.20.30.0/24"
    PublicSubnet3CIDR  = "10.20.25.0/24"
    PublicSubnet2CIDR  = "10.20.20.0/24"
    VpcCIDR            = "10.20.0.0/16"
    ProjectName        = "stackguardian"
    EnvironmentName    = "dev"
    PrivateSubnet2CIDR = "10.20.40.0/24"
    PublicSubnet1CIDR  = "10.20.10.0/24"
  }
  template_body = var.cloudformation_template
}