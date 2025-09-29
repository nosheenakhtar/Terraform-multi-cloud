# Optional remote state (Azure Storage)
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "tfstate-rg"
#     storage_account_name = "tfstateacctxyz"
#     container_name       = "state"
#     key                  = "multicloud/azure/production/terraform.tfstate"
#   }
# }

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" { features {} }

module "stack" {
  source          = "../../../modules/azure-rg-vm"
  project         = var.project
  location        = var.location
  address_space   = var.address_space
  subnet_prefix   = var.subnet_prefix
  admin_username  = var.admin_username
  public_key_path = var.public_key_path
  tags = {
    env     = var.env
    project = var.project
    owner   = var.owner
  }
}

output "public_ip" { value = module.stack.public_ip }
