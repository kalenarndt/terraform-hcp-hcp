# HCP Vault Cluster - VPC Peering

The Configuration in this directroy will create the following objects:

- 1 - Vault Dev Cluster
- 1 - HCP HVN Network `[172.25.16.0/20]`
- 1 - HCP HVN Route Table
- 1 - VPC Peering Request
- 1 - VPC Peering Connection Accepter
- 1 - Vault Admin Token


This example creates a simple Vault cluster with a Transit Gateway attachment and generates a Vault token in the `admin` namespace and outputs it for use. Please note that this cluster is not exposed to the internet

## Pre-Requisites:
You must have the following pre-created:
- AWS VPC in a region that HCP Vault supports
  - us-west-2
  - us-east-1
  - eu-central-1
  - eu-west-1
  - eu-west-2
- AWS Account Credentials with the proper permissions
- HCP Account Credentials with the proper permissions
An example for these can be found [here]()

---
## Usage

To run this example you need to populate the following information:

### AWS Authentication
You have 2 options to configure authentication:

1. Export your AWS credentials as environment variables 
2. Rename the [terraform.tfvars.example](/terraform.tfvars.example) to terraform.tfvars and populate the AWS variables.

### HCP Authentication
You have 2 options to configure authentication:
1. Export your HCP Client Secret and ID as environment variables - [Documentation](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth)
2. Rename the [terraform.tfvars.example](/terraform.tfvars.example) to terraform.tfvars and populate the HCP variables

### Required Variables:
- `vpc_owner_id`  - Owner ID of the VPC
- `vpc_id` - ID of the target VPc
- `vpc_region` - Region where the target VPC resides
- `destination_cidr` - Where HCP Vault will route to
- Auth Credentials (Detailed Above)


### Execution

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Please keep in mind that this will provision a Vault cluster which will incur cost. <!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.51.0 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | >=0.10.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hcp"></a> [hcp](#module\_hcp) | github.com/kalenarndt/terraform-hcp-hcp | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | Access key used to authenticate with AWS. Environment variables are preferred | `string` | `null` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | Secret key used to authenticate with AWS. Environment variables are preferred | `string` | `null` | no |
| <a name="input_destination_cidr"></a> [destination\_cidr](#input\_destination\_cidr) | CIDR block for remote subnets that will be allowed to access HCP | `string` | `"10.0.0.0/16"` | no |
| <a name="input_hcp_client_id"></a> [hcp\_client\_id](#input\_hcp\_client\_id) | Client ID used to authenticate with HCP. Environment variables are preferred | `string` | `null` | no |
| <a name="input_hcp_client_secret"></a> [hcp\_client\_secret](#input\_hcp\_client\_secret) | Client secret used to authenticate with HCP. Environment variables are preferred | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Vault cluster. | `string` | `"us-west-2"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Peer ID from the AWS peering VPC | `string` | `""` | no |
| <a name="input_vpc_owner_id"></a> [vpc\_owner\_id](#input\_vpc\_owner\_id) | Peer account ID from AWS | `string` | `""` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Region where the AWS VPC was created | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vault_cluster_id"></a> [vault\_cluster\_id](#output\_vault\_cluster\_id) | n/a |
| <a name="output_vault_private_endpoint_url"></a> [vault\_private\_endpoint\_url](#output\_vault\_private\_endpoint\_url) | n/a |
| <a name="output_vault_tier"></a> [vault\_tier](#output\_vault\_tier) | n/a |
| <a name="output_vault_token"></a> [vault\_token](#output\_vault\_token) | n/a |
| <a name="output_vault_version"></a> [vault\_version](#output\_vault\_version) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
