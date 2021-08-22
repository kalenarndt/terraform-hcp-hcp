# HCP Vault Cluster - VPC Peering

The Configuration in this directroy will create the following objects:

- 1 - Consul Development Cluster - X Small
- 1 - Vault Dev Cluster
- 1 - HCP Vault HVN `[172.25.16.0/20]`
- 1 - HCP Consul HVN `[172.25.17.0/20]`
- 1 - HCP Vault HVN Route Table
- 1 - HCP Consul HVN Route Table
- 2 - VPC Peering Requests
- 2 - VPC Peering Connection Accepters
- 1 - Consul Root Token
- 1 - Vault Admin Token


This example creates a Vault and Consul cluster each on their own HVN and peers them with a common VPC inside of AWS. A root and admin token are generated along with the k8s secrets and are supplied as outputs. Please note that these clusters are not exposed to the internet and need to be accessed via the AWS VPC.

## Pre-Requisites:
You must have the following pre-created:
- 1 AWS VPC in a region that HCP Vault / Consul supports
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

### Additional information

If different VPCs need to be peered with (eg. Vault to VPC-A with Owner-A and Consul to VPC-B with Owner-B) then you can use the following variables. If you don't then the values for the required variables above are used.

- `vpc_vault_id` - ID of the target Vault VPC
- `vpc_vault_owner_id` - Owner ID of the target Vault VPC
- `vpc_vault_region` - Region where the target VPC resides
- `vpc_consul_id` - ID of the target Consul VPC
- `vpc_consul_owner_id` Owner ID of the target Consul VPC
- `vpc_consul_region` Region where the target VPC resides

### Execution

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Please keep in mind that this will provision a Consul and Vault cluster which will incur cost. 