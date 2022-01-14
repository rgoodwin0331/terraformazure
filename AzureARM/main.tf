terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

# Configure the Microsoft Azure Provider.
provider "azurerm" {}


resource "azurerm_resource_group" "rg" {
  name     = "SampleCoRG"
  location = "eastus2"
}


resource "azurerm_resource_group_template_deployment" "arm" {
  name                = "arm"
  resource_group_name = azurerm_resource_group.rg.name
  deployment_mode = "Complete"
  template_content    = file("template.json")

  }
