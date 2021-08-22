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

Please keep in mind that this will provision a Vault cluster which will incur cost. 