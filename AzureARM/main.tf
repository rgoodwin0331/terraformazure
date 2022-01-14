terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92"
    }
  }
}

# Configure the Microsoft Azure Provider.
provider "azurerm" {}

resource "azurerm_resource_group_template_deployment" "SampleCoRG" {
  name                = "SampleCoRG"
  resource_group_name = azurerm_resource_group.SampleCoRG.id
  deployment_mode = "Incremental"

  template_body = file("template.json")

  parameters =  {
        "location" =  {
            "value" =  "eastus2"
        },
        "extendedLocation" =  {
            "value" =  {}
        },
        "virtualNetworkName" =  {
            "value" =  "SampleCo-Internal"
        },
        "resourceGroup" =  {
            "value" =  "SampleCoRG"
        },
        "addressSpaces" =  {
            "value" =  [
                "172.16.0.0/16"
            ]
        },
        "ipv6Enabled" =  {
            "value" =  false
        },
        "subnetCount" =  {
            "value" =  1
        },
        "subnet0_name" =  {
            "value" =  "Servers"
        },
        "subnet0_addressRange" =  {
            "value" =  "172.16.1.0/24"
        },
        "ddosProtectionPlanEnabled" =  {
            "value" =  false
        },
        "firewallEnabled" =  {
            "value" =  false
        },  
        "bastionEnabled" =  {
            "value" =  false
        }
    }
  
}
