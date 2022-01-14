terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.13.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}

resource "azurerm_resource_group_template_deployment" "terraform-arm" {
  name                = "terraform-arm-01"
  resource_group_name = azurerm_resource_group.terraform-arm.name

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

  deployment_mode = "Incremental"
}

