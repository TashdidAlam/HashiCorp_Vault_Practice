terraform {
  required_version = "~> 1.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.12.0"
    }
  }
  backend "s3" {
    bucket         = "your-terraform-state-bucket"   # <-- Replace with your S3 bucket name
    key            = "state/terraform.tfstate"
    region         = var.region # <-- Optionally variablize backend region
    dynamodb_table = "your-lock-table"               # <-- Optional: for state locking
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
