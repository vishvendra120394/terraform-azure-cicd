terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70"

    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    container_name       = "tfstate"
    storage_account_name = "tfstatevish2026"
    key                  = "pre-prod.terraform.tfstate"
    use_azuread_auth     = true
  }
}
provider "azurerm" {
  features {
  }
}
