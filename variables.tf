variable "create_vault_cluster" {
  description = "Flag to create a Vault cluster"
  type        = bool
  default     = false
}

variable "create_consul_cluster" {
  description = "Flag to create an HCP Consul cluster"
  type        = bool
  default     = false
}

variable "generate_consul_token" {
  description = "Flag to generate HCP Consul root token"
  type        = bool
  default     = false
}

variable "generate_vault_token" {
  description = "Flag to generate HCP Vault admin token"
  type        = bool
  default     = false
}

variable "vault_tier" {
  description = "Tier to provision in HCP Vault - dev, standard_small, standard_medium, standard_large"
  type        = string
  default     = "dev"
  validation {
    condition     = var.vault_tier != "dev" || var.vault_tier != "standard_small" || var.vault_tier != "standard_medium" || var.vault_tier != "standard_large"
    error_message = "The variable vault_tier must be \"dev\", \"standard_small\", \"standard_medium\", or \"standard_large\"."
  }
}

variable "vault_cluster_name" {
  description = "The name (id) of the HCP Vault cluster."
  type        = string
  default     = "hcp-vault-cluster"
}

variable "vault_public_endpoint" {
  description = "Exposes the cluster to the internet. Defaults to false"
  type        = bool
  default     = false
}

variable "min_vault_version" {
  description = "Minimum Vault version to use when creating the cluster. If null, defaults to HCP recommended version"
  type        = string
  default     = null
}

variable "output_vault_token" {
  description = "Flag to output the generated Vault token as a non-sensitive object. Use with caution"
  type        = bool
  default     = false
}

##### Consul
variable "consul_size" {
  description = "Size of the HCP Consul nodes - x_small, small, medium, large - x_small only works with development tier"
  type        = string
  default     = "x_small"
  validation {
    condition     = var.consul_size != "x_small" || var.consul_size != "small" || var.consul_size != "medium" || var.consul_size != "large"
    error_message = "The variable consul_size must be \"x_small\", \"small\", \"medium\", or \"large\"."
  }
}

variable "consul_tier" {
  description = "Tier of the HCP Consul cluster - development, standard, plus - x_small only works with development tier"
  type        = string
  default     = "development"
  validation {
    condition     = var.consul_tier != "development" || var.consul_tier != "standard" || var.consul_tier != "plus"
    error_message = "The variable consul_size must be \"development\", \"standard\", or \"plus\"."
  }
}

variable "consul_public_endpoint" {
  description = "Exposes the Consul cluster to the internet. Defaults to false"
  type        = bool
  default     = false
}

variable "min_consul_version" {
  description = "Minimum Consul version to use when creating the cluster. If null, defaults to HCP recommended version"
  type        = string
  default     = null
}

variable "connect_enabled" {
  description = "Denotes the Consul connect feature should be enabled. Defaults to true"
  type        = bool
  default     = true
}

variable "consul_cluster_name" {
  description = "The name (id) of the HCP Consul cluster"
  type        = string
  default     = "hcp-consul-cluster"
}

variable "consul_datacenter" {
  description = "The Consul datacenter name. If set to null the datacenter will be set to the Consul cluster name. Defaults to null"
  type        = string
  default     = null
}

variable "output_consul_token" {
  description = "Flag to output the generated Consul token as a non-sensitive object. Use with caution"
  type        = bool
  default     = false
}

#### End Consul ####

variable "vpc_peering" {
  description = "Flag to enable vpc peering with HCP and AWS"
  type        = bool
  default     = true
}

variable "transit_gw" {
  description = "Flag to use an AWS transit gateway"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "Peer ID from the AWS peering VPC"
  type        = string
  default     = ""
}

variable "vpc_owner_id" {
  description = "Peer account ID from AWS"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "Destination CIDR block of the AWS VPC"
  type        = string
  default     = ""
}

variable "vpc_region" {
  description = "Region where the AWS VPC was created"
  type        = string
}

variable "hvn_cidr_block" {
  description = "CIDR block for the HVN VPC"
  type        = string
  default     = "172.25.16.0/20"
}

variable "hvn_route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "hcp-hvn-route"
}

variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = "us-west-2"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN, HCP Vault, or HCP Consul cluster."
  type        = string
  default     = "aws"
}

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-vault-hvn"
}

variable "hvn_peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "hcp-hvn-peering"
}

variable "transit_gw_attachment_id" {
  description = "Name of the transit gateway attachment in HVN"
  type        = string
  default     = "hcp-hvn-transit-gw"
}

variable "transit_gw_id" {
  description = "ID of the transit gateway that exists in AWS that HCP will attach to"
  type        = string
  default     = ""
}

variable "resource_share_arn" {
  description = "Amazon Resource Name of the Resource Share that is needed to grant HCP acces to the transit gateway"
  type        = string
  default     = ""
}


