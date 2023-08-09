provider "aws" {
  region = local.aws_region
}

terraform {
  backend "s3" {
    bucket = "testorg-terraform-state"
    key    = "dev"
    region = "ap-south-1"
  }
}

