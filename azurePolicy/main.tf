
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.36"
    }
  }
}

provider "azurerm" {
  environment     = "public"
  version         = "2.36"

  features {}
}

data "azurerm_subscription" "current" {
}
