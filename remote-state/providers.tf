terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "81s-sai"
    key            = "remote"
    region         = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
