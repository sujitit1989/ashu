terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

provider "azurerm" {
  features {}
    subscription_id = "a734659e-9ed8-4fe4-945b-26ae3ffd6f73"

}
  
