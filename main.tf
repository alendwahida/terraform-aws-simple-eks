terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
	  Env = "practice"
	  Owner = "alend"
    }
  }
}