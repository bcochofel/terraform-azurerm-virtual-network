# terraform-azurerm-virtual-network

This module creates Azure Virtual Network and also let's you create a DDoS protection plan (or use one already created).
This module also validates the name according to the Azure Resource naming restrictions

Subnets are not handled by this module.

## Usage

```hcl
provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.6.0"

  name     = "rg-vnet-basic-example"
  location = "North Europe"
}

module "vnet" {
  source = "../.."

  resource_group_name = module.rg.name
  name                = "vnet-basic-example"
  address_space       = ["10.0.0.0/16"]

  depends_on = [module.rg]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_ddos_protection_plan.ddospp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_network_ddos_protection_plan.ddospp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_ddos_protection_plan) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network.<br>You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_create_ddos_pp"></a> [create\_ddos\_pp](#input\_create\_ddos\_pp) | Whether or not to create DDoS protection plan. | `bool` | `false` | no |
| <a name="input_ddos_pp_name"></a> [ddos\_pp\_name](#input\_ddos\_pp\_name) | DDos protection plan name of an existing plan or to create a new one.<br>If create\_ddos\_pp is false and enable\_ddos\_pp is true this variable<br>must reference a DDoS protection plan already created and<br>ddos\_pp\_resource\_group\_name must also be defined. | `string` | `""` | no |
| <a name="input_ddos_pp_resource_group_name"></a> [ddos\_pp\_resource\_group\_name](#input\_ddos\_pp\_resource\_group\_name) | Resource Group name if using existing DDoS protection plan. | `string` | `""` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of IP addresses of DNS servers. | `list(string)` | `[]` | no |
| <a name="input_enable_ddos_pp"></a> [enable\_ddos\_pp](#input\_enable\_ddos\_pp) | Whether or not to enable DDoS protection plan.<br>DDoS can be enabled by creating a new plan or use one that already exists. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network.<br>The Resource Group must already exist. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to Resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | The list of address spaces used by the virtual network. |
| <a name="output_ddospp_id"></a> [ddospp\_id](#output\_ddospp\_id) | The ID of the DDoS Protection Plan. |
| <a name="output_ddospp_virtual_network_ids"></a> [ddospp\_virtual\_network\_ids](#output\_ddospp\_virtual\_network\_ids) | A list of Virtual Network ID's associated with the DDoS Protection Plan. |
| <a name="output_id"></a> [id](#output\_id) | The virtual network ID. |
| <a name="output_location"></a> [location](#output\_location) | The location/region where the virtual network is created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the virtual network. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group in which to create the virtual network. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Run tests

```bash
cd test/
go test -v
```

## pre-commit hooks

This repository uses [pre-commit](https://pre-commit.com/).

To install execute:

```bash
pre-commit install --install-hooks -t commit-msg
```

To run the hooks you need to install:

* [terraform](https://github.com/hashicorp/terraform)
* [terraform-docs](https://github.com/terraform-docs/terraform-docs)
* [TFLint](https://github.com/terraform-linters/tflint)
* [TFSec](https://github.com/tfsec/tfsec)
* [checkov](https://github.com/bridgecrewio/checkov)

## References

* [Azure Resource naming restrictions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)
* [Azure Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
* [Azure DDoS Protection Plan](https://docs.microsoft.com/en-us/azure/ddos-protection/ddos-protection-overview)
* [Terraform azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
* [Terraform azurerm_network_ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan)
