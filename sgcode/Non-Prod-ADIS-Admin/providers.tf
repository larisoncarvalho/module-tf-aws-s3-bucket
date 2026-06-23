provider "aws" {
  region = "us-east-1"
  endpoints {
    sts = "https://sts.amazonaws.com"
    iam = "https://iam.amazonaws.com"
  }
}