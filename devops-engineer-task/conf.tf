terraform {
# backend configuration to store statefiles
backend "s3" {
    bucket         = "mystate-file-for-collaboration"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
  required_version = ">= 1.2.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
