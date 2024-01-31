terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#access: PZDJEJz1Whvj6j6Z+lwc5CbNA01BCPPmVoPsf0Sd
#secret: AKIASHYA67DDEEIYE6VV

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  access_key = "AKIASHYA67DDEEIYE6VV"
  secret_key = "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"
}