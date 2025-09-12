terraform {
  required_version = "~> 1.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.12.0"
    }
  }
  backend "s3" {
    bucket  = "tashdid-terraform-state-files"
    key     = "vault_test/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}
