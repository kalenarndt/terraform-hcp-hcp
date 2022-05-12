<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.15 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | >=0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.13.0 |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_vpc_attachment_accepter.hvn_aws_tgw_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |
| [aws_ec2_transit_gateway_vpc_attachment_accepter.hvn_consul_aws_tgw_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |
| [aws_ec2_transit_gateway_vpc_attachment_accepter.hvn_vault_aws_tgw_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment_accepter) | resource |
| [aws_ram_principal_association.hcp_aws_ram](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_principal_association.hcp_consul_aws_ram](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_principal_association.hcp_vault_aws_ram](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_vpc_peering_connection_accepter.hvn_aws_vpc_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_accepter.hvn_consul_aws_vpc_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_accepter.hvn_vault_aws_vpc_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [hcp_aws_network_peering.hvn_aws_peer](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering) | resource |
| [hcp_aws_network_peering.hvn_consul_aws_peer](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering) | resource |
| [hcp_aws_network_peering.hvn_vault_aws_peer](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering) | resource |
| [hcp_aws_transit_gateway_attachment.hvn_consul_transit_gw](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_transit_gateway_attachment) | resource |
| [hcp_aws_transit_gateway_attachment.hvn_transit_gw](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_transit_gateway_attachment) | resource |
| [hcp_aws_transit_gateway_attachment.hvn_vault_transit_gw](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_transit_gateway_attachment) | resource |
| [hcp_consul_cluster.consul_cluster](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster) | resource |
| [hcp_consul_cluster_root_token.consul_token](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster_root_token) | resource |
| [hcp_consul_snapshot.snapshot](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_snapshot) | resource |
| [hcp_hvn.hcp_consul_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn.hcp_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn.hcp_vault_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn_route.hvn_consul_tgw_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [hcp_hvn_route.hvn_consul_vpc_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [hcp_hvn_route.hvn_tgw_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [hcp_hvn_route.hvn_vault_tgw_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [hcp_hvn_route.hvn_vault_vpc_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [hcp_hvn_route.hvn_vpc_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
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
| <a name="input_consul_destination_cidr"></a> [consul\_destination\_cidr](#input\_consul\_destination\_cidr) | Destination CIDR for HCP Consul to communicate with. Only required if HCP Consul requires a different route table than Vault and you are creating both clusters in 1 call. If not specified var.destination\_cidr is used | `string` | `""` | no |
| <a name="input_consul_public_endpoint"></a> [consul\_public\_endpoint](#input\_consul\_public\_endpoint) | Exposes the Consul cluster to the internet. Defaults to false | `bool` | `false` | no |
| <a name="input_consul_size"></a> [consul\_size](#input\_consul\_size) | Size of the HCP Consul nodes - x\_small, small, medium, large - x\_small only works with development tier | `string` | `"x_small"` | no |
| <a name="input_consul_tier"></a> [consul\_tier](#input\_consul\_tier) | Tier of the HCP Consul cluster - development, standard, plus - x\_small only works with development tier | `string` | `"development"` | no |
| <a name="input_create_consul_cluster"></a> [create\_consul\_cluster](#input\_create\_consul\_cluster) | Flag to create an HCP Consul cluster | `bool` | `false` | no |
| <a name="input_create_vault_cluster"></a> [create\_vault\_cluster](#input\_create\_vault\_cluster) | Flag to create a Vault cluster | `bool` | `false` | no |
| <a name="input_destination_cidr"></a> [destination\_cidr](#input\_destination\_cidr) | Destination CIDR block for HCP to communicate with | `string` | `""` | no |
| <a name="input_federation"></a> [federation](#input\_federation) | Flag to enable Consul Federation. Defaults to false | `bool` | `false` | no |
| <a name="input_generate_consul_token"></a> [generate\_consul\_token](#input\_generate\_consul\_token) | Flag to generate HCP Consul root token | `bool` | `false` | no |
| <a name="input_generate_vault_token"></a> [generate\_vault\_token](#input\_generate\_vault\_token) | Flag to generate HCP Vault admin token | `bool` | `false` | no |
| <a name="input_hvn_cidr_block"></a> [hvn\_cidr\_block](#input\_hvn\_cidr\_block) | CIDR block for the HVN VPC | `string` | `"172.25.16.0/20"` | no |
| <a name="input_hvn_consul_cidr_block"></a> [hvn\_consul\_cidr\_block](#input\_hvn\_consul\_cidr\_block) | CIDR block for the HVN Consul VPC | `string` | `"172.25.17.0/24"` | no |
| <a name="input_hvn_consul_id"></a> [hvn\_consul\_id](#input\_hvn\_consul\_id) | The ID of the HCP Consul HVN. | `string` | `"hcp-consul-hvn"` | no |
| <a name="input_hvn_consul_peering_id"></a> [hvn\_consul\_peering\_id](#input\_hvn\_consul\_peering\_id) | The Peering ID of the HCP Consul HVN. | `string` | `"hcp-consul-hvn-peer"` | no |
| <a name="input_hvn_consul_route_id"></a> [hvn\_consul\_route\_id](#input\_hvn\_consul\_route\_id) | The ID of the HCP Consul HVN route. | `string` | `"hcp-consul-hvn-route"` | no |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"hcp-hvn"` | no |
| <a name="input_hvn_peering_id"></a> [hvn\_peering\_id](#input\_hvn\_peering\_id) | The ID of the HCP peering connection. | `string` | `"hcp-hvn-peering"` | no |
| <a name="input_hvn_route_id"></a> [hvn\_route\_id](#input\_hvn\_route\_id) | The ID of the HCP HVN route. | `string` | `"hcp-hvn-route"` | no |
| <a name="input_hvn_to_hvn_peering"></a> [hvn\_to\_hvn\_peering](#input\_hvn\_to\_hvn\_peering) | Enables automatic HVN to HVN peering when creating a secondary cluster in Consul Federation. | `bool` | `true` | no |
| <a name="input_hvn_vault_cidr_block"></a> [hvn\_vault\_cidr\_block](#input\_hvn\_vault\_cidr\_block) | CIDR block for the HVN Vault VPC | `string` | `"172.25.16.0/24"` | no |
| <a name="input_hvn_vault_id"></a> [hvn\_vault\_id](#input\_hvn\_vault\_id) | The ID of the HCP Vault HVN. | `string` | `"hcp-vault-hvn"` | no |
| <a name="input_hvn_vault_peering_id"></a> [hvn\_vault\_peering\_id](#input\_hvn\_vault\_peering\_id) | The Peering ID of the HCP Vault HVN. | `string` | `"hcp-vault-hvn-peer"` | no |
| <a name="input_hvn_vault_route_id"></a> [hvn\_vault\_route\_id](#input\_hvn\_vault\_route\_id) | The ID of the HCP Vault HVN route. | `string` | `"hcp-vault-hvn-route"` | no |
| <a name="input_min_consul_version"></a> [min\_consul\_version](#input\_min\_consul\_version) | Minimum Consul version to use when creating the cluster. If null, defaults to HCP recommended version | `string` | `""` | no |
| <a name="input_min_vault_version"></a> [min\_vault\_version](#input\_min\_vault\_version) | Minimum Vault version to use when creating the cluster. If null, defaults to HCP recommended version | `string` | `""` | no |
| <a name="input_output_consul_token"></a> [output\_consul\_token](#input\_output\_consul\_token) | Flag to output the generated Consul token as a non-sensitive object. Use with caution | `bool` | `false` | no |
| <a name="input_output_vault_token"></a> [output\_vault\_token](#input\_output\_vault\_token) | Flag to output the generated Vault token as a non-sensitive object. Use with caution | `bool` | `false` | no |
| <a name="input_primary_consul_cluster_name"></a> [primary\_consul\_cluster\_name](#input\_primary\_consul\_cluster\_name) | Primary Consul cluster name (id) that secondary clusters will be federating with. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Vault cluster. | `string` | `""` | no |
| <a name="input_resource_share_arn"></a> [resource\_share\_arn](#input\_resource\_share\_arn) | Amazon Resource Name of the Resource Share that is needed to grant HCP acces to the transit gateway | `string` | `""` | no |
| <a name="input_single_hvn"></a> [single\_hvn](#input\_single\_hvn) | Flag that creates a single HVN that is shared between Vault and Consul. Defaults to false | `bool` | `false` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | Name of the Consul Snapshot that will be created | `string` | `""` | no |
| <a name="input_transit_gateway"></a> [transit\_gateway](#input\_transit\_gateway) | Flag to use an AWS transit gateway | `bool` | `false` | no |
| <a name="input_transit_gw_attachment_id"></a> [transit\_gw\_attachment\_id](#input\_transit\_gw\_attachment\_id) | Name of the transit gateway attachment for collapsed network in HVN | `string` | `"hcp-hvn-transit-gw"` | no |
| <a name="input_transit_gw_consul_attachment_id"></a> [transit\_gw\_consul\_attachment\_id](#input\_transit\_gw\_consul\_attachment\_id) | Name of the transit gateway attachment for Consul in HVN | `string` | `"hcp-hvn-consul-transit-gw"` | no |
| <a name="input_transit_gw_id"></a> [transit\_gw\_id](#input\_transit\_gw\_id) | ID of the transit gateway that exists in AWS that HCP will attach to | `string` | `""` | no |
| <a name="input_transit_gw_vault_attachment_id"></a> [transit\_gw\_vault\_attachment\_id](#input\_transit\_gw\_vault\_attachment\_id) | Name of the transit gateway attachment for Vault in HVN | `string` | `"hcp-hvn-vault-transit-gw"` | no |
| <a name="input_vault_cluster_name"></a> [vault\_cluster\_name](#input\_vault\_cluster\_name) | The name (id) of the HCP Vault cluster. | `string` | `"hcp-vault-cluster"` | no |
| <a name="input_vault_destination_cidr"></a> [vault\_destination\_cidr](#input\_vault\_destination\_cidr) | Destination CIDR for HCP Vault to communicate with. Only required if HCP Vault requires a different route table than Consul. If not specified var.destination\_cidr is used | `string` | `""` | no |
| <a name="input_vault_public_endpoint"></a> [vault\_public\_endpoint](#input\_vault\_public\_endpoint) | Exposes the cluster to the internet. Defaults to false | `bool` | `false` | no |
| <a name="input_vault_tier"></a> [vault\_tier](#input\_vault\_tier) | Tier to provision in HCP Vault - dev, standard\_small, standard\_medium, standard\_large | `string` | `"dev"` | no |
| <a name="input_vpc_consul_id"></a> [vpc\_consul\_id](#input\_vpc\_consul\_id) | Peer ID of the VPC in AWS that the HVN (Consul) will peer with. If not set, module peers with vpc\_id | `string` | `""` | no |
| <a name="input_vpc_consul_owner_id"></a> [vpc\_consul\_owner\_id](#input\_vpc\_consul\_owner\_id) | Peer account ID from AWS for the VPC that Consul will use. Only required if Consul is peering with a VPC that has a different owner than vpc\_owner\_id | `string` | `""` | no |
| <a name="input_vpc_consul_region"></a> [vpc\_consul\_region](#input\_vpc\_consul\_region) | Region where the destination VPC that Consul will peer with. Only required if Consul HVN is peering with a VPC in a different region than vpc\_region | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Peer ID from the AWS peering VPC | `string` | `""` | no |
| <a name="input_vpc_owner_id"></a> [vpc\_owner\_id](#input\_vpc\_owner\_id) | Peer account ID from AWS | `string` | `""` | no |
| <a name="input_vpc_peering"></a> [vpc\_peering](#input\_vpc\_peering) | Flag to enable vpc peering with HCP and AWS | `bool` | `true` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Region where the AWS VPC was created | `string` | `""` | no |
| <a name="input_vpc_vault_id"></a> [vpc\_vault\_id](#input\_vpc\_vault\_id) | Peer ID of the VPC in AWS that the HVN (Vault) will peer with. If not set, module peers with vpc\_id | `string` | `""` | no |
| <a name="input_vpc_vault_owner_id"></a> [vpc\_vault\_owner\_id](#input\_vpc\_vault\_owner\_id) | Peer account ID from AWS for the VPC that Vault will use. Only required if Vault is peering with a VPC that has a different owner than vpc\_owner\_id | `string` | `""` | no |
| <a name="input_vpc_vault_region"></a> [vpc\_vault\_region](#input\_vpc\_vault\_region) | Region where the destination VPC that Vault will peer with. Only required if Vault HVN is peering with a VPC in a different region than vpc\_region | `string` | `""` | no |

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
| <a name="output_tgw_consul_target_link"></a> [tgw\_consul\_target\_link](#output\_tgw\_consul\_target\_link) | n/a |
| <a name="output_tgw_single_hvn_target_link"></a> [tgw\_single\_hvn\_target\_link](#output\_tgw\_single\_hvn\_target\_link) | n/a |
| <a name="output_tgw_vault_target_link"></a> [tgw\_vault\_target\_link](#output\_tgw\_vault\_target\_link) | n/a |
| <a name="output_vault_cluster_id"></a> [vault\_cluster\_id](#output\_vault\_cluster\_id) | n/a |
| <a name="output_vault_private_endpoint_url"></a> [vault\_private\_endpoint\_url](#output\_vault\_private\_endpoint\_url) | n/a |
| <a name="output_vault_public_endpoint_url"></a> [vault\_public\_endpoint\_url](#output\_vault\_public\_endpoint\_url) | n/a |
| <a name="output_vault_tier"></a> [vault\_tier](#output\_vault\_tier) | n/a |
| <a name="output_vault_token"></a> [vault\_token](#output\_vault\_token) | n/a |
| <a name="output_vault_version"></a> [vault\_version](#output\_vault\_version) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
