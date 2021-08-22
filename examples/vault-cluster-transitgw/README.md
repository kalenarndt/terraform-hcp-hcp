# HCP Vault Cluster - Transit Gateway

The Configuration in this directroy will create the following objects:

- 1 - Vault Dev Cluster
- 1 - HCP HVN Network `[172.25.16.0/20]`
- 1 - HCP HVN Route Table  
- 1 - Transit Gateway Attachment
- 1 - Vault Admin Token 


This example creates a simple Vault cluster with a Transit Gateway attachment and generates a Vault token in the `admin` namespace and outputs it for use. Please note that this cluster is not exposed to the internet

## Pre-Requisites:
You must have the following pre-created:
- AWS Transit Gateway in a region that HCP Vault supports
  - us-west-2
  - us-east-1
  - eu-central-1
  - eu-west-1
  - eu-west-2
- AWS Resource Access Manager with external principals enabled
- AWS Resource Access Manager associated with the Transit Gateway

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
- `transit_gw_id` - ID of the Transit Gateway that HVN will attach to
- `resource_share_arn` - Resource Share ARN that will be used for attachment
- `var.region` - Region where the Transit Gateway resides
- Auth Credentials (Detailed Above)


### Execution

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Please keep in mind that this will provision a Vault cluster which will incur cost. 