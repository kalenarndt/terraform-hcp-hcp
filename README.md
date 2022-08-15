<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | >=0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcp_consul_cluster.consul_cluster](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster) | resource |
| [hcp_consul_cluster_root_token.consul_token](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster_root_token) | resource |
| [hcp_consul_snapshot.snapshot](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_snapshot) | resource |
| [hcp_hvn.hcp_consul_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn.hcp_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn.hcp_vault_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_vault_cluster.vault_cluster](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster) | resource |
| [hcp_vault_cluster_admin_token.vault_token](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster_admin_token) | resource |
| [hcp_consul_cluster.primary](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/consul_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_hvn_to_hvn_peering"></a> [auto\_hvn\_to\_hvn\_peering](#input\_auto\_hvn\_to\_hvn\_peering) | Flag to enable auto hvn to hvn peering. Defaults to false | `bool` | `false` | no |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider of the HCP HVN, HCP Vault, or HCP Consul cluster. | `string` | `"aws"` | no |
| <a name="input_connect_enabled"></a> [connect\_enabled](#input\_connect\_enabled) | Denotes the Consul connect feature should be enabled. Defaults to true | `bool` | `true` | no |
| <a name="input_consul_cluster_name"></a> [consul\_cluster\_name](#input\_consul\_cluster\_name) | The name (id) of the HCP Consul cluster | `string` | `"hcp-consul-cluster"` | no |
| <a name="input_consul_datacenter"></a> [consul\_datacenter](#input\_consul\_datacenter) | The Consul datacenter name. If set to null the datacenter will be set to the Consul cluster name. Defaults to null | `string` | `""` | no |
| <a name="input_consul_public_endpoint"></a> [consul\_public\_endpoint](#input\_consul\_public\_endpoint) | Exposes the Consul cluster to the internet. Defaults to false | `bool` | `false` | no |
| <a name="input_consul_size"></a> [consul\_size](#input\_consul\_size) | Size of the HCP Consul nodes - x\_small, small, medium, large - x\_small only works with development tier | `string` | `"x_small"` | no |
| <a name="input_consul_tier"></a> [consul\_tier](#input\_consul\_tier) | Tier of the HCP Consul cluster - development, standard, plus - x\_small only works with development tier | `string` | `"development"` | no |
| <a name="input_create_consul_cluster"></a> [create\_consul\_cluster](#input\_create\_consul\_cluster) | Flag to create an HCP Consul cluster | `bool` | `false` | no |
| <a name="input_create_vault_cluster"></a> [create\_vault\_cluster](#input\_create\_vault\_cluster) | Flag to create a Vault cluster | `bool` | `false` | no |
| <a name="input_federation"></a> [federation](#input\_federation) | Flag to enable Consul Federation. Defaults to false | `bool` | `false` | no |
| <a name="input_generate_consul_token"></a> [generate\_consul\_token](#input\_generate\_consul\_token) | Flag to generate HCP Consul root token | `bool` | `false` | no |
| <a name="input_generate_vault_token"></a> [generate\_vault\_token](#input\_generate\_vault\_token) | Flag to generate HCP Vault admin token | `bool` | `false` | no |
| <a name="input_hvn_cidr_block"></a> [hvn\_cidr\_block](#input\_hvn\_cidr\_block) | CIDR block for the HVN VPC | `string` | `"172.25.16.0/20"` | no |
| <a name="input_hvn_consul_cidr_block"></a> [hvn\_consul\_cidr\_block](#input\_hvn\_consul\_cidr\_block) | CIDR block for the HVN Consul VPC | `string` | `"172.25.17.0/24"` | no |
| <a name="input_hvn_consul_id"></a> [hvn\_consul\_id](#input\_hvn\_consul\_id) | The ID of the HCP Consul HVN. | `string` | `"hcp-consul-hvn"` | no |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"hcp-hvn"` | no |
| <a name="input_hvn_route_id"></a> [hvn\_route\_id](#input\_hvn\_route\_id) | The ID of the HCP HVN route. | `string` | `"hcp-hvn-route"` | no |
| <a name="input_hvn_to_hvn_peering"></a> [hvn\_to\_hvn\_peering](#input\_hvn\_to\_hvn\_peering) | Enables automatic HVN to HVN peering when creating a secondary cluster in Consul Federation. | `bool` | `true` | no |
| <a name="input_hvn_vault_cidr_block"></a> [hvn\_vault\_cidr\_block](#input\_hvn\_vault\_cidr\_block) | CIDR block for the HVN Vault VPC | `string` | `"172.25.16.0/24"` | no |
| <a name="input_hvn_vault_id"></a> [hvn\_vault\_id](#input\_hvn\_vault\_id) | The ID of the HCP Vault HVN. | `string` | `"hcp-vault-hvn"` | no |
| <a name="input_min_consul_version"></a> [min\_consul\_version](#input\_min\_consul\_version) | Minimum Consul version to use when creating the cluster. If null, defaults to HCP recommended version | `string` | `""` | no |
| <a name="input_min_vault_version"></a> [min\_vault\_version](#input\_min\_vault\_version) | Minimum Vault version to use when creating the cluster. If null, defaults to HCP recommended version | `string` | `""` | no |
| <a name="input_output_consul_token"></a> [output\_consul\_token](#input\_output\_consul\_token) | Flag to output the generated Consul token as a non-sensitive object. Use with caution | `bool` | `false` | no |
| <a name="input_output_vault_token"></a> [output\_vault\_token](#input\_output\_vault\_token) | Flag to output the generated Vault token as a non-sensitive object. Use with caution | `bool` | `false` | no |
| <a name="input_primary_consul_cluster_name"></a> [primary\_consul\_cluster\_name](#input\_primary\_consul\_cluster\_name) | Primary Consul cluster name (id) that secondary clusters will be federating with. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Vault cluster. | `string` | `""` | no |
| <a name="input_single_hvn"></a> [single\_hvn](#input\_single\_hvn) | Flag that creates a single HVN that is shared between Vault and Consul. Defaults to false | `bool` | `false` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | Name of the Consul Snapshot that will be created | `string` | `""` | no |
| <a name="input_vault_cluster_name"></a> [vault\_cluster\_name](#input\_vault\_cluster\_name) | The name (id) of the HCP Vault cluster. | `string` | `"hcp-vault-cluster"` | no |
| <a name="input_vault_public_endpoint"></a> [vault\_public\_endpoint](#input\_vault\_public\_endpoint) | Exposes the cluster to the internet. Defaults to false | `bool` | `false` | no |
| <a name="input_vault_tier"></a> [vault\_tier](#input\_vault\_tier) | Tier to provision in HCP Vault - dev, standard\_small, standard\_medium, standard\_large | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_consul_cert"></a> [consul\_cert](#output\_consul\_cert) | n/a |
| <a name="output_consul_cluster_id"></a> [consul\_cluster\_id](#output\_consul\_cluster\_id) | n/a |
| <a name="output_consul_config"></a> [consul\_config](#output\_consul\_config) | n/a |
| <a name="output_consul_datacenter"></a> [consul\_datacenter](#output\_consul\_datacenter) | n/a |
| <a name="output_consul_k8s_token"></a> [consul\_k8s\_token](#output\_consul\_k8s\_token) | n/a |
| <a name="output_consul_private_endpoint_url"></a> [consul\_private\_endpoint\_url](#output\_consul\_private\_endpoint\_url) | n/a |
| <a name="output_consul_public_endpoint_url"></a> [consul\_public\_endpoint\_url](#output\_consul\_public\_endpoint\_url) | n/a |
| <a name="output_consul_size"></a> [consul\_size](#output\_consul\_size) | n/a |
| <a name="output_consul_tier"></a> [consul\_tier](#output\_consul\_tier) | n/a |
| <a name="output_consul_token"></a> [consul\_token](#output\_consul\_token) | n/a |
| <a name="output_consul_version"></a> [consul\_version](#output\_consul\_version) | n/a |
| <a name="output_hvn_consul_link"></a> [hvn\_consul\_link](#output\_hvn\_consul\_link) | n/a |
| <a name="output_hvn_single_link"></a> [hvn\_single\_link](#output\_hvn\_single\_link) | n/a |
| <a name="output_hvn_vault_link"></a> [hvn\_vault\_link](#output\_hvn\_vault\_link) | n/a |
| <a name="output_vault_cluster_id"></a> [vault\_cluster\_id](#output\_vault\_cluster\_id) | n/a |
| <a name="output_vault_private_endpoint_url"></a> [vault\_private\_endpoint\_url](#output\_vault\_private\_endpoint\_url) | n/a |
| <a name="output_vault_public_endpoint_url"></a> [vault\_public\_endpoint\_url](#output\_vault\_public\_endpoint\_url) | n/a |
| <a name="output_vault_tier"></a> [vault\_tier](#output\_vault\_tier) | n/a |
| <a name="output_vault_token"></a> [vault\_token](#output\_vault\_token) | n/a |
| <a name="output_vault_version"></a> [vault\_version](#output\_vault\_version) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
