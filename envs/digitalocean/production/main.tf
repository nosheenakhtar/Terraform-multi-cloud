# Optional remote state (DO Spaces via S3 backend)
# terraform {
#   backend "s3" {
#     endpoint   = "https://nyc3.digitaloceanspaces.com"
#     bucket     = "YOUR_STATE_BUCKET"
#     key        = "multicloud/do/production/terraform.tfstate"
#     region     = "us-east-1"
#     skip_credentials_validation = true
#     skip_region_validation      = true
#     force_path_style = true
#   }
# }

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.40"
    }
  }
}

provider "digitalocean" {}

module "stack" {
  source               = "../../../modules/do-vpc-droplet"
  project              = var.project
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  size                 = var.size
  image                = var.image
  ssh_key_fingerprint  = var.ssh_key_fingerprint
  tags = [var.env, var.project, var.owner]
}

output "droplet_ip" { value = module.stack.droplet_ip }
