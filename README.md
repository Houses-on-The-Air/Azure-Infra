<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_region-abbreviation-mapping"></a> [region-abbreviation-mapping](#module\_region-abbreviation-mapping) | PartTimeLegend/region-abbreviation-mapping/azure | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.ass](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.peer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_abbr"></a> [abbr](#output\_abbr) | n/a |
| <a name="output_app-cluster"></a> [app-cluster](#output\_app-cluster) | n/a |
| <a name="output_app-cluster-dns"></a> [app-cluster-dns](#output\_app-cluster-dns) | n/a |
| <a name="output_app-cluster-identity"></a> [app-cluster-identity](#output\_app-cluster-identity) | n/a |
| <a name="output_app-cluster-loc"></a> [app-cluster-loc](#output\_app-cluster-loc) | n/a |
| <a name="output_app-cluster-network-plugin"></a> [app-cluster-network-plugin](#output\_app-cluster-network-plugin) | n/a |
| <a name="output_app-cluster-network-policy"></a> [app-cluster-network-policy](#output\_app-cluster-network-policy) | n/a |
| <a name="output_app-cluster-node-count"></a> [app-cluster-node-count](#output\_app-cluster-node-count) | n/a |
| <a name="output_app-cluster-rg"></a> [app-cluster-rg](#output\_app-cluster-rg) | n/a |
| <a name="output_app-cluster-vm-size"></a> [app-cluster-vm-size](#output\_app-cluster-vm-size) | n/a |
| <a name="output_mgmt-cluster"></a> [mgmt-cluster](#output\_mgmt-cluster) | n/a |
| <a name="output_mgmt-cluster-dns"></a> [mgmt-cluster-dns](#output\_mgmt-cluster-dns) | n/a |
| <a name="output_mgmt-cluster-identity"></a> [mgmt-cluster-identity](#output\_mgmt-cluster-identity) | n/a |
| <a name="output_mgmt-cluster-loc"></a> [mgmt-cluster-loc](#output\_mgmt-cluster-loc) | n/a |
| <a name="output_mgmt-cluster-network-plugin"></a> [mgmt-cluster-network-plugin](#output\_mgmt-cluster-network-plugin) | n/a |
| <a name="output_mgmt-cluster-network-policy"></a> [mgmt-cluster-network-policy](#output\_mgmt-cluster-network-policy) | n/a |
| <a name="output_mgmt-cluster-node-count"></a> [mgmt-cluster-node-count](#output\_mgmt-cluster-node-count) | n/a |
| <a name="output_mgmt-cluster-rg"></a> [mgmt-cluster-rg](#output\_mgmt-cluster-rg) | n/a |
| <a name="output_mgmt-cluster-vm-size"></a> [mgmt-cluster-vm-size](#output\_mgmt-cluster-vm-size) | n/a |
<!-- END_TF_DOCS -->