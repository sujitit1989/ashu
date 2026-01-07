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
    subscription_id = "099d73e0-39f5-4b5c-bb6d-741b2dcec4af"

}
  
