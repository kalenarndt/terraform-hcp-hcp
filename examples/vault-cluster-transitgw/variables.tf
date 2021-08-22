variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "us-west-2"
}

variable "hcp_client_id" {
  description = "Client ID used to authenticate with HCP. Environment variables are preferred"
  type        = string
  sensitive   = false
  default     = null
}

variable "hcp_client_secret" {
  description = "Client secret used to authenticate with HCP. Environment variables are preferred"
  type        = string
  sensitive   = true
  default     = null
}

variable "aws_access_key" {
  description = "Access key used to authenticate with AWS. Environment variables are preferred"
  type        = string
  sensitive   = false
  default     = null
}

variable "aws_secret_key" {
  description = "Secret key used to authenticate with AWS. Environment variables are preferred"
  type        = string
  sensitive   = true
  default     = null
}

variable "destination_cidr" {
  description = "CIDR block for remote subnets that will be allowed to access HCP"
  type        = string
  default     = "10.0.0.0/16"
}

variable "transit_gw_id" {
  description = "ID for the AWS Transit Gateway that HVN will attach to."
  type        = string
}

variable "resource_share_arn" {
  description = "Resource Share ARN that will be used with the vault provider ID for attachment"
  type        = string
}