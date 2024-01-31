terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "<my_region>"
  access_key = "<my_access_key>"
  secret_key = "<my_secert_key>"
}
