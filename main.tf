terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "remote-state-bucket"
    key            = "remote/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
}

module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    ami = var.ami
    project_name = var.project_name
    public_subnet_ids = module.vpc.public_subnet_ids[*]
    vpc_id = module.vpc.vpc_id
    private_subnet_ids = module.vpc.private_subnet_ids[*]
    vpc_cidr = var.vpc_cidr
}