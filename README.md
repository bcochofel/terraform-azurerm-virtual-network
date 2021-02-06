# terraform-azurerm-virtual-network

This module creates Azure Virtual Network and also let's you create a DDoS protection plan (or use one already created).

Subnets are not handle by this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| azurerm | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.41.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The address space that is used the virtual network.<br>You can supply more than one address space. | `list(string)` | n/a | yes |
| create\_ddos\_pp | Whether or not to create DDoS protection plan. | `bool` | `false` | no |
| ddos\_pp\_name | DDos protection plan name of an existing plan or to create a new one.<br>If create\_ddos\_pp is false and enable\_ddos\_pp is true this variable<br>must reference a DDoS protection plan already created and<br>ddos\_pp\_resource\_group\_name must also be defined. | `string` | `""` | no |
| ddos\_pp\_resource\_group\_name | Resource Group name if using existing DDoS protection plan. | `string` | `""` | no |
| dns\_servers | List of IP addresses of DNS servers. | `list(string)` | `[]` | no |
| enable\_ddos\_pp | Whether or not to enable DDoS protection plan.<br>DDoS can be enabled by creating a new plan or use one that already exists. | `bool` | `false` | no |
| name | The name of the virtual network.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the virtual network.<br>The Resource Group must already exist. | `string` | n/a | yes |
| tags | A mapping of tags which should be assigned to Resources. | `map(string)` | `{}` | no |
| vm\_protection\_enabled | Whether to enable VM protection for all the subnets in this Virtual Network. | `bool` | `false` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Run tests

```bash
cd test/
go test -v
```

# References

* [Azure Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
* [Azure DDoS Protection Plan](https://docs.microsoft.com/en-us/azure/ddos-protection/ddos-protection-overview)
* [Terraform azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
* [Terraform azurerm_network_ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan)
