output "vault_private_endpoint_url" {
  value       = concat(hcp_vault_cluster.vault_cluster.*.vault_private_endpoint_url, [""])[0]
  description = "Private Endpoint URL for the HCP Vault cluster"
}

output "vault_public_endpoint_url" {
  value       = concat(hcp_vault_cluster.vault_cluster.*.vault_public_endpoint_url, [""])[0]
  description = "Public Endpoint URL for the HCP Vault cluster"
}

output "vault_cluster_id" {
  value       = concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0]
  description = "ID of the HCP Vault cluster that was created"
}

output "vault_tier" {
  value       = concat(hcp_vault_cluster.vault_cluster.*.tier, [""])[0]
  description = "HCP Vault tier that was deployed"
}

output "vault_version" {
  value       = concat(hcp_vault_cluster.vault_cluster.*.vault_version, [""])[0]
  description = "HCP Vault version"
}

output "vault_token" {
  value       = local.output_vault_token_nonsensitive
  description = "HCP Vault Admin token"
}

output "consul_cluster_id" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0]
  description = "ID of the HCP Consul cluster that was created."
}

output "consul_private_endpoint_url" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.consul_private_endpoint_url, [""])[0]
  description = "Private Endpoint URL for the HCP Consul cluster"
}

output "consul_public_endpoint_url" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.consul_public_endpoint_url, [""])[0]
  description = "Public Endpoint URL for the HCP Consul cluster"
}

output "consul_tier" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.tier, [""])[0]
  description = "HCP Consul tier that was deployed"
}

output "consul_size" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.size, [""])[0]
  description = "Size of the HCP Consul cluster"
}

output "consul_version" {
  value       = concat(hcp_consul_cluster.consul_cluster.*.consul_version, [""])[0]
  description = "HCP Consul version"
}

output "consul_datacenter" {
  value = concat(hcp_consul_cluster.consul_cluster.*.datacenter, [""])[0]
}

output "consul_token" {
  value       = local.output_consul_token_nonsensitive
  description = "HCP Consul Admin token"
}

output "consul_k8s_token" {
  value = local.output_consul_k8s_token_nonsensitive
}

output "hvn_vault_link" {
  value = concat(hcp_hvn.hcp_vault_hvn.*.hvn_id, [""])[0]
}

output "hvn_single_link" {
  value = concat(hcp_hvn.hcp_hvn.*.hvn_id, [""])[0]
}

output "hvn_single_cidr_block" {
  value       = concat(hcp_hvn.hcp_hvn.*.cidr_block, [""])[0]
  description = "CIDR Block that was configured on the single HCP HVN"
}

output "hvn_vault_cidr_block" {
  value       = concat(hcp_hvn.hcp_vault_hvn.*.cidr_block, [""])[0]
  description = "CIDR Block that was configured on the HCP Vault HVN"
}

output "hvn_consul_cidr_block" {
  value       = concat(hcp_hvn.hcp_consul_hvn.*.cidr_block, [""])[0]
  description = "CIDR Block that was configured on the HCP Consul HVN"
}

output "hvn_consul_link" {
  value = concat(hcp_hvn.hcp_consul_hvn.*.hvn_id, [""])[0]
}

output "consul_config" {
  value = concat(hcp_consul_cluster.consul_cluster.*.consul_config_file, [""])[0]
}

output "consul_cert" {
  value = concat(hcp_consul_cluster.consul_cluster.*.consul_ca_file, [""])[0]
}

output "boundary_cluster_url" {
  value       = concat(hcp_boundary_cluster.boundary_cluster.*.cluster_url, [""])[0]
  description = "Public URL for the HCP Boundary cluster"
}

output "boundary_cluster_id" {
  value       = try(trimsuffix(trimprefix(try(hcp_boundary_cluster.boundary_cluster[0].cluster_url, ""), "https://"), ".boundary.hashicorp.cloud"), null)
  description = "HCP Boundary cluster ID"
}

output "boundary_auth_id" {
  value       = var.boundary_cluster_name != "" ? jsondecode(data.http.boundary_auth_id[0].response_body).items[0].id : ""
  description = "Default auth_id for username and password"
}

output "boundary_username" {
  value       = concat(hcp_boundary_cluster.boundary_cluster.*.username, [""])[0]
  description = "HCP Boundary admin username"
}

output "boundary_password" {
  value       = var.output_boundary_password ? concat(hcp_boundary_cluster.boundary_cluster.*.password, [""])[0] : null
  sensitive   = true
  description = "HCP Boundary administrator password"
}
