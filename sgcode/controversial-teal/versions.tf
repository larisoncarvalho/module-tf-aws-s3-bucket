# Versions anchor us
# provider source declared once—
# upgrades flow with care

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}