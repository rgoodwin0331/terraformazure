terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

# Configure the Microsoft Azure Provider.
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "SampleCoRG"
  location = "eastus2"
}


resource "azurerm_resource_group_template_deployment" "SampleCoRG" {
  name                = "SampleCoRG"
  resource_group_name = azurerm_resource_group.rg.name
  deployment_mode = "Incremental"
  template_content = file("template.json")

  }
