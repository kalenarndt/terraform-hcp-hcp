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

variable "hvn_vault_route_id" {
  description = "The ID of the HCP Vault HVN route."
  type        = string
  default     = "hcp-vault-hvn-route"
}

variable "hvn_vault_peering_id" {
  description = "The Peering ID of the HCP Vault HVN."
  type        = string
  default     = "hcp-vault-hvn-peer"
}

variable "vpc_vault_owner_id" {
  description = "Peer account ID from AWS for the VPC that Vault will use. Only required if Vault is peering with a VPC that has a different owner than vpc_owner_id"
  type        = string
  default     = ""
}

variable "vpc_vault_region" {
  description = "Region where the destination VPC that Vault will peer with. Only required if Vault HVN is peering with a VPC in a different region than vpc_region"
  type        = string
  default     = ""
}

variable "vpc_vault_id" {
  description = "Peer ID of the VPC in AWS that the HVN (Vault) will peer with. If not set, module peers with vpc_id"
  type        = string
  default     = ""
}

variable "vault_destination_cidr" {
  description = "Destination CIDR for HCP Vault to communicate with. Only required if HCP Vault requires a different route table than Consul. If not specified var.destination_cidr is used"
  type        = string
  default     = ""
}

variable "transit_gw_vault_attachment_id" {
  description = "Name of the transit gateway attachment for Vault in HVN"
  type        = string
  default     = "hcp-hvn-vault-transit-gw"
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

variable "auto_hvn_to_hvn_peering" {
  description = "Flag to enable auto hvn to hvn peering. Defaults to false"
  type        = bool
  default     = false
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

variable "hvn_consul_route_id" {
  description = "The ID of the HCP Consul HVN route."
  type        = string
  default     = "hcp-consul-hvn-route"
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

variable "hvn_consul_peering_id" {
  description = "The Peering ID of the HCP Consul HVN."
  type        = string
  default     = "hcp-consul-hvn-peer"
}

variable "vpc_consul_owner_id" {
  description = "Peer account ID from AWS for the VPC that Consul will use. Only required if Consul is peering with a VPC that has a different owner than vpc_owner_id"
  type        = string
  default     = ""
}

variable "vpc_consul_region" {
  description = "Region where the destination VPC that Consul will peer with. Only required if Consul HVN is peering with a VPC in a different region than vpc_region"
  type        = string
  default     = ""
}

variable "vpc_consul_id" {
  description = "Peer ID of the VPC in AWS that the HVN (Consul) will peer with. If not set, module peers with vpc_id"
  type        = string
  default     = ""
}

variable "consul_destination_cidr" {
  description = "Destination CIDR for HCP Consul to communicate with. Only required if HCP Consul requires a different route table than Vault and you are creating both clusters in 1 call. If not specified var.destination_cidr is used"
  type        = string
  default     = ""
}

variable "transit_gw_consul_attachment_id" {
  description = "Name of the transit gateway attachment for Consul in HVN"
  type        = string
  default     = "hcp-hvn-consul-transit-gw"
}
#### End Consul ####

variable "vpc_peering" {
  description = "Flag to enable vpc peering with HCP and AWS"
  type        = bool
  default     = true
}

variable "single_hvn" {
  description = "Flag that creates a single HVN that is shared between Vault and Consul. Defaults to false"
  type        = bool
  default     = false
}

variable "transit_gateway" {
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

variable "destination_cidr" {
  description = "Destination CIDR block for HCP to communicate with"
  type        = string
  default     = ""
}

variable "vpc_region" {
  description = "Region where the AWS VPC was created"
  type        = string
  default     = ""
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

variable "hvn_peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "hcp-hvn-peering"
}

variable "transit_gw_attachment_id" {
  description = "Name of the transit gateway attachment for collapsed network in HVN"
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