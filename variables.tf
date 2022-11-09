variable "create_vault_cluster" {
  description = "Flag to create a Vault cluster"
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
    condition     = var.vault_tier != "dev" || var.vault_tier != "standard_small" || var.vault_tier != "standard_medium" || var.vault_tier != "standard_large" || var.vault_tier != "starter_small" || var.vault_tier != "plus_small" || var.vault_tier != "plus_medium" || var.vault_tier != "plus_large"
    error_message = "The variable vault_tier must be \"dev\", \"standard_small\", \"standard_medium\", \"starter_small\", \"standard_large\", \"plus_small\", \"plus_medium\", or \"plus_large\"."
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
  default     = ""
}

variable "output_vault_token" {
  description = "Flag to output the generated Vault token as a non-sensitive object. Use with caution"
  type        = bool
  default     = false
}

variable "hvn_vault_id" {
  description = "The ID of the HCP Vault HVN."
  type        = string
  default     = "hcp-vault-hvn"
}

variable "hvn_vault_cidr_block" {
  description = "CIDR block for the HVN Vault VPC"
  type        = string
  default     = "172.25.16.0/24"
}

##### Consul
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
  default     = ""
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
  default     = ""
}

variable "hvn_to_hvn_peering" {
  description = "Enables automatic HVN to HVN peering when creating a secondary cluster in Consul Federation."
  type        = bool
  default     = true
}

variable "output_consul_token" {
  description = "Flag to output the generated Consul token as a non-sensitive object. Use with caution"
  type        = bool
  default     = false
}

variable "snapshot_name" {
  description = "Name of the Consul Snapshot that will be created"
  type        = string
  default     = ""
}

variable "federation" {
  description = "Flag to enable Consul Federation. Defaults to false"
  type        = bool
  default     = false
}

variable "primary_consul_cluster_name" {
  description = "Primary Consul cluster name (id) that secondary clusters will be federating with."
  type        = string
  default     = ""
}

variable "hvn_consul_cidr_block" {
  description = "CIDR block for the HVN Consul VPC"
  type        = string
  default     = "172.25.17.0/24"
}

variable "hvn_consul_id" {
  description = "The ID of the HCP Consul HVN."
  type        = string
  default     = "hcp-consul-hvn"
}

variable "single_hvn" {
  description = "Flag that creates a single HVN that is shared between Vault and Consul. Defaults to false"
  type        = bool
  default     = false
}

/* variable "prevent_destroy" {
  description = "Flag that sets the prevent_destroy argument on the HCP Consul / Vault / Boundary clusters"
  type        = bool
  default     = true
} */

variable "hvn_cidr_block" {
  description = "CIDR block for the HVN VPC"
  type        = string
  default     = "172.25.16.0/20"
}

variable "region" {
  description = "The region of the HCP HVN and Vault cluster."
  type        = string
  default     = ""
  validation {
    condition     = var.region != "us-west-2" || var.region != "us-east-1" || var.region != "eu-west-1" || var.region != "eu-west-2" || var.region != "eu-central-1" || var.region != "ap-southeast-1" || var.region != "ap-southeast-2"
    error_message = "The variable region must be \"us-west-2\", \"us-east-1\", \"eu-west-1\", \"eu-west-2\", \"eu-central-1\", \"ap-southeast-1\", or \"ap-southeast-2\"."
  }
}

variable "vault_primary_cluster_id" {
  description = "(Optional) Cluster ID of the HCP Vault Cluster that will be the primary in this configuration"
  type        = string
  default     = ""
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN, HCP Vault, or HCP Consul cluster."
  type        = string
  default     = "aws"
}

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hcp-hvn"
}

variable "boundary_user" {
  description = "Boundary administrator username"
  type        = string
  default     = ""
}

variable "boundary_cluster_name" {
  description = "Name of the HCP Boundary cluster that will be created"
  type        = string
  default     = ""
}

variable "boundary_password" {
  description = "Boundary administrator password. This will show up in the state file so please be careful"
  type        = string
  default     = ""
}

variable "output_boundary_password" {
  description = "Conditional that allows for the password to be output as a sensitive value"
  type        = bool
  default     = false
}
