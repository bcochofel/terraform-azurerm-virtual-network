provider "azurerm" {
  features {}
}

module "rg" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "bcochofel/resource-group/azurerm"
  version = "1.6.0"

  name     = "rg-vnet-create-ddospp-example"
  location = "North Europe"
}

module "vnet" {
  source = "../.."

  resource_group_name = module.rg.name
  name                = "vnet-create-ddospp-example"
  address_space       = ["10.0.0.0/16"]

  enable_ddos_pp = true
  create_ddos_pp = true
  ddos_pp_name   = "ddospp-example"

  depends_on = [module.rg]
}
