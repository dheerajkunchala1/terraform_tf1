# Powershell Command az account list-locations -o table
# rm -r .terraform*
# rm -r terraform.tfstate*

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }

    backend "azurerm" {
      resource_group_name = "MyPersonal1"
      storage_account_name = "terraformstate2024911"
      container_name = "tfstatefiles"
      key = "terraform.tfstate"
    }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-westus"
}

