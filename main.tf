terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
	  Env = var.env
	  Owner = var.owner
    }
  }
}