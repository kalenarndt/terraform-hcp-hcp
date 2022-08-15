######################################     Single HVN Networking     #######################################
// Creates a single HCP HVN for both Consul and Vault
resource "hcp_hvn" "hcp_hvn" {
  count          = var.single_hvn ? 1 : 0
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_cidr_block
}

######################################     Vault HVN Networking     #######################################
##                             Only used if you are putting Vault on it's own HVN                        ##
###########################################################################################################

// creates the hvn vault network resource
resource "hcp_hvn" "hcp_vault_hvn" {
  count          = var.create_vault_cluster && var.single_hvn == false ? 1 : 0
  hvn_id         = var.hvn_vault_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_vault_cidr_block
}

######################################     Consul HVN Networking     ######################################
##                            Only used if you are putting Consul on it's own HVN                        ##
###########################################################################################################

// creates the hvn consul network resource
resource "hcp_hvn" "hcp_consul_hvn" {
  count          = var.create_consul_cluster && var.single_hvn == false ? 1 : 0
  hvn_id         = var.hvn_consul_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_consul_cidr_block
}

######################################      HCP Vault Cluster      ######################################

// creates the vault cluster on the hvn network resource
resource "hcp_vault_cluster" "vault_cluster" {
  count             = var.create_vault_cluster ? 1 : 0
  hvn_id            = var.single_hvn == true ? hcp_hvn.hcp_hvn[0].hvn_id : hcp_hvn.hcp_vault_hvn[0].hvn_id
  cluster_id        = var.vault_cluster_name
  tier              = var.vault_tier
  public_endpoint   = var.vault_public_endpoint
  min_vault_version = var.min_vault_version != "" ? var.min_vault_version : null
}

// generates a vault admin token for the cluster
resource "hcp_vault_cluster_admin_token" "vault_token" {
  count      = var.create_vault_cluster && var.generate_vault_token || var.generate_vault_token ? 1 : 0
  cluster_id = concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0] != "" ? concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0] : var.vault_cluster_name
}

######################################      HCP Consul Cluster      ######################################

// creates the hcp consul cluster
resource "hcp_consul_cluster" "consul_cluster" {
  count                   = var.create_consul_cluster ? 1 : 0
  cluster_id              = var.consul_cluster_name
  hvn_id                  = var.single_hvn == true ? hcp_hvn.hcp_hvn[0].hvn_id : hcp_hvn.hcp_consul_hvn[0].hvn_id
  tier                    = var.consul_tier
  size                    = var.consul_size
  public_endpoint         = var.consul_public_endpoint
  datacenter              = var.consul_datacenter != "" ? var.consul_datacenter : var.consul_cluster_name
  min_consul_version      = var.min_consul_version != "" ? var.min_consul_version : null
  connect_enabled         = var.connect_enabled
  auto_hvn_to_hvn_peering = var.hvn_to_hvn_peering
  primary_link            = var.federation != false ? data.hcp_consul_cluster.primary[0].cluster_id : null
}

// generates a consul root token for the cluster
resource "hcp_consul_cluster_root_token" "consul_token" {
  count = var.create_consul_cluster && var.generate_consul_token || var.generate_consul_token ? 1 : 0

  cluster_id = concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] != "" ? concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] : var.consul_cluster_name
}

// outputs the tokens in clear text if variable is set to true
locals {
  output_consul_k8s_token_nonsensitive = var.output_consul_token && var.generate_consul_token == true ? nonsensitive(hcp_consul_cluster_root_token.consul_token[0].kubernetes_secret) : null
  output_consul_token_nonsensitive     = var.output_consul_token && var.generate_consul_token == true ? nonsensitive(hcp_consul_cluster_root_token.consul_token[0].secret_id) : null
  output_vault_token_nonsensitive      = var.output_vault_token && var.generate_vault_token == true ? nonsensitive(hcp_vault_cluster_admin_token.vault_token[0].token) : null
}

########### NEEDS TESTING#

// retrieves the primary link for the federation peering.
data "hcp_consul_cluster" "primary" {
  count = var.federation ? 1 : 0

  cluster_id = var.primary_consul_cluster_name != "" ? var.primary_consul_cluster_name : null
}

// snapshots the consul cluster
resource "hcp_consul_snapshot" "snapshot" {
  count = var.snapshot_name != "" ? 1 : 0

  cluster_id    = concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] != "" ? concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] : var.consul_cluster_name
  snapshot_name = var.snapshot_name
}
