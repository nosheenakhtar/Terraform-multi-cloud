# Optional remote state (S3 + DynamoDB)
# terraform {
#   backend "s3" {
#     bucket         = "YOUR_STATE_BUCKET"
#     key            = "multicloud/aws/production/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "YOUR_LOCK_TABLE"
#     encrypt        = true
#   }
# }

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "stack" {
  source          = "../../../modules/aws-network-ec2"
  project         = var.project
  region          = var.region
  cidr_block      = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  instance_type   = var.instance_type
  public_key_path = var.public_key_path
  tags = {
    env     = var.env
    project = var.project
    owner   = var.owner
  }
}

output "instance_public_ip" { value = module.stack.instance_public_ip }
