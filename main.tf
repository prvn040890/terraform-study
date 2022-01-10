#terraform settings 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

#configure azure provider

provider "azurerm" {
  features {}
}


