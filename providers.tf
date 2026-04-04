terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"     # pinned to a stable version
    }
  }
}

provider "aws" {
  region = var.aws_region
}