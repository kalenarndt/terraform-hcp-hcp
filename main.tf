###################################### Single HVN VPC Networking ###################################### 

// creates a route for HVN to aws via the vpc
resource "hcp_hvn_route" "hvn_vpc_route" {
  count = var.vpc_peering && var.single_hvn ? 1 : 0

  hvn_link         = hcp_hvn.hcp_hvn[0].self_link
  hvn_route_id     = var.hvn_route_id
  destination_cidr = var.destination_cidr
  target_link      = hcp_aws_network_peering.hvn_aws_peer[0].self_link
}

// creates a peering request with aws for a flat hvn
resource "hcp_aws_network_peering" "hvn_aws_peer" {
  count = var.vpc_peering && var.single_hvn ? 1 : 0

  hvn_id          = hcp_hvn.hcp_hvn[0].hvn_id
  peering_id      = var.hvn_peering_id
  peer_vpc_id     = var.vpc_id
  peer_account_id = var.vpc_owner_id
  peer_vpc_region = var.vpc_region
}

// Creates a single HCP HVN for both Consul and Vault
resource "hcp_hvn" "hcp_hvn" {
  count = var.single_hvn && var.create_vault_cluster || var.single_hvn && var.create_consul_cluster && var.create_vault_cluster ? 1 : 0

  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_cidr_block
}

// accept the peering request between hvn and aws
resource "aws_vpc_peering_connection_accepter" "hvn_aws_vpc_accept" {
  count = var.vpc_peering && var.single_hvn ? 1 : 0

  vpc_peering_connection_id = hcp_aws_network_peering.hvn_aws_peer[0].provider_peering_id
  auto_accept               = true
  tags = {
    Name = var.hvn_peering_id
  }
}
###################################### END Single HVN VPC Networking ######################################

######################################   Single HVN Transit Gateway  ######################################

// associates the hcp provider id with the resource_share arn in aws
resource "aws_ram_principal_association" "hcp_aws_ram" {
  count = var.transit_gateway && var.single_hvn ? 1 : 0

  resource_share_arn = var.resource_share_arn
  principal          = hcp_hvn.hcp_hvn[0].provider_account_id
}

// creates an attachment to the aws transit gateway from hvn
resource "hcp_aws_transit_gateway_attachment" "hvn_transit_gw" {
  count = var.transit_gateway && var.single_hvn ? 1 : 0

  hvn_id                        = hcp_hvn.hcp_hvn[0].hvn_id
  transit_gateway_attachment_id = var.transit_gw_attachment_id
  transit_gateway_id            = var.transit_gw_id
  resource_share_arn            = var.resource_share_arn
}

// accept the hvn attachment to the transit gateway
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "hvn_aws_tgw_accept" {
  count = var.transit_gateway && var.single_hvn ? 1 : 0

  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.hvn_transit_gw[0].provider_transit_gateway_attachment_id
}

// creates a route from hvn to aws via the transit gateway
resource "hcp_hvn_route" "hvn_tgw_route" {
  count = var.transit_gateway && var.single_hvn ? 1 : 0

  hvn_link         = hcp_hvn.hcp_hvn[0].self_link
  hvn_route_id     = var.hvn_route_id
  destination_cidr = var.destination_cidr
  target_link      = hcp_aws_transit_gateway_attachment.hvn_transit_gw[0].self_link
}

###################################### Single HVN Transit Gateway #####################################

###################################### Vault VPC Networking ###################################### 

// creates the hvn vault network resource
resource "hcp_hvn" "hcp_vault_hvn" {
  count = var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  hvn_id         = var.hvn_vault_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_vault_cidr_block
}


// creates a peering request with aws for hcp vault
resource "hcp_aws_network_peering" "hvn_vault_aws_peer" {
  count = var.vpc_peering && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  hvn_id          = hcp_hvn.hcp_vault_hvn[0].hvn_id
  peering_id      = var.hvn_vault_peering_id
  peer_vpc_id     = var.vpc_vault_id != "" ? var.vpc_vault_id : var.vpc_id
  peer_account_id = var.vpc_vault_owner_id != "" ? var.vpc_vault_owner_id : var.vpc_owner_id
  peer_vpc_region = var.vpc_vault_region != "" ? var.vpc_vault_region : var.vpc_region
}

// creates a route for HVN vault to aws via the vpc
resource "hcp_hvn_route" "hvn_vault_vpc_route" {
  count = var.vpc_peering && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  hvn_link         = hcp_hvn.hcp_vault_hvn[0].self_link
  hvn_route_id     = var.hvn_vault_route_id
  destination_cidr = var.vault_destination_cidr != "" ? var.vault_destination_cidr : var.destination_cidr
  target_link      = hcp_aws_network_peering.hvn_vault_aws_peer[0].self_link
}

// accept the peering request between hvn vault and aws
resource "aws_vpc_peering_connection_accepter" "hvn_vault_aws_vpc_accept" {
  count = var.vpc_peering && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  vpc_peering_connection_id = hcp_aws_network_peering.hvn_vault_aws_peer[0].provider_peering_id
  auto_accept               = true
  tags = {
    Name = var.hvn_vault_peering_id
  }
}
######################################  END Vault VPC Networking ###################################### 

###################################### Vault Transit Gateway Networking ################################
// associates the hcp provider id with the resource_share arn in aws
resource "aws_ram_principal_association" "hcp_vault_aws_ram" {
  count = var.transit_gateway && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  resource_share_arn = var.resource_share_arn
  principal          = hcp_hvn.hcp_vault_hvn[0].provider_account_id
}

// creates an attachment to the aws transit gateway from hvn
resource "hcp_aws_transit_gateway_attachment" "hvn_vault_transit_gw" {
  count = var.transit_gateway && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  hvn_id                        = hcp_hvn.hcp_vault_hvn[0].hvn_id
  transit_gateway_attachment_id = var.transit_gw_vault_attachment_id
  transit_gateway_id            = var.transit_gw_id
  resource_share_arn            = var.resource_share_arn
}

// accept the hvn attachment to the transit gateway
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "hvn_vault_aws_tgw_accept" {
  count = var.transit_gateway && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.hvn_vault_transit_gw[0].provider_transit_gateway_attachment_id
}

// creates a route from hvn to aws via the transit gateway
resource "hcp_hvn_route" "hvn_vault_tgw_route" {
  count = var.transit_gateway && var.create_vault_cluster && var.single_hvn == false ? 1 : 0

  hvn_link         = hcp_hvn.hcp_vault_hvn[0].self_link
  hvn_route_id     = var.hvn_vault_route_id
  destination_cidr = var.vault_destination_cidr != "" ? var.vault_destination_cidr : var.destination_cidr
  target_link      = hcp_aws_transit_gateway_attachment.hvn_vault_transit_gw[0].self_link
}
###################################### END Vault Transit Gateway Networking ################################

###################################### Consul VPC Networking ###################################### 
// creates a route for HVN to aws via the vpc
resource "hcp_hvn_route" "hvn_consul_vpc_route" {
  count = var.vpc_peering && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  hvn_link         = hcp_hvn.hcp_consul_hvn[0].self_link
  hvn_route_id     = var.hvn_consul_route_id
  destination_cidr = var.consul_destination_cidr != "" ? var.consul_destination_cidr : var.destination_cidr
  target_link      = hcp_aws_network_peering.hvn_consul_aws_peer[0].self_link
}

// creates a peering request with aws
resource "hcp_aws_network_peering" "hvn_consul_aws_peer" {
  count = var.vpc_peering && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  hvn_id          = hcp_hvn.hcp_consul_hvn[0].hvn_id
  peering_id      = var.hvn_consul_peering_id
  peer_vpc_id     = var.vpc_consul_id != "" ? var.vpc_consul_id : var.vpc_id
  peer_account_id = var.vpc_consul_owner_id != "" ? var.vpc_consul_owner_id : var.vpc_owner_id
  peer_vpc_region = var.vpc_consul_region != "" ? var.vpc_consul_region : var.vpc_region
}

// creates the hvn consul network resource
resource "hcp_hvn" "hcp_consul_hvn" {
  count = var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  hvn_id         = var.hvn_consul_id
  cloud_provider = var.cloud_provider
  region         = var.region
  cidr_block     = var.hvn_consul_cidr_block
}

// accept the peering request between hvn and aws
resource "aws_vpc_peering_connection_accepter" "hvn_consul_aws_vpc_accept" {
  count = var.vpc_peering && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  vpc_peering_connection_id = hcp_aws_network_peering.hvn_consul_aws_peer[0].provider_peering_id
  auto_accept               = true
  tags = {
    Name = var.hvn_consul_peering_id
  }
}
###################################### END Consul VPC Networking ###################################### 

###################################### Consul Transit Gateway Networking ######################################

// associates the hcp provider id with the resource_share arn in aws
resource "aws_ram_principal_association" "hcp_consul_aws_ram" {
  count = var.transit_gateway && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  resource_share_arn = var.resource_share_arn
  principal          = hcp_hvn.hcp_consul_hvn[0].provider_account_id
}

// creates an attachment to the aws transit gateway from hvn
resource "hcp_aws_transit_gateway_attachment" "hvn_consul_transit_gw" {
  count = var.transit_gateway && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  hvn_id                        = hcp_hvn.hcp_consul_hvn[0].hvn_id
  transit_gateway_attachment_id = var.transit_gw_consul_attachment_id
  transit_gateway_id            = var.transit_gw_id
  resource_share_arn            = var.resource_share_arn
}

// accept the hvn attachment to the transit gateway
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "hvn_consul_aws_tgw_accept" {
  count = var.transit_gateway && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.hvn_consul_transit_gw[0].provider_transit_gateway_attachment_id
}

// creates a route from hvn to aws via the transit gateway
resource "hcp_hvn_route" "hvn_consul_tgw_route" {
  count = var.transit_gateway && var.create_consul_cluster && var.single_hvn == false ? 1 : 0

  hvn_link         = hcp_hvn.hcp_consul_hvn[0].self_link
  hvn_route_id     = var.hvn_consul_route_id
  destination_cidr = var.consul_destination_cidr != "" ? var.consul_destination_cidr : var.destination_cidr
  target_link      = hcp_aws_transit_gateway_attachment.hvn_consul_transit_gw[0].self_link
}

###################################### END Consul Transit Gateway Networking ######################################
// creates the vault cluster on the hvn network resource
resource "hcp_vault_cluster" "vault_cluster" {
  count = var.create_vault_cluster ? 1 : 0

  hvn_id            = var.single_hvn == true ? hcp_hvn.hcp_hvn[0].hvn_id : hcp_hvn.hcp_vault_hvn[0].hvn_id
  cluster_id        = var.vault_cluster_name
  tier              = var.vault_tier
  public_endpoint   = var.vault_public_endpoint
  min_vault_version = var.min_vault_version
}

// generates a vault admin token for the cluster
resource "hcp_vault_cluster_admin_token" "vault_token" {
  count = var.create_vault_cluster && var.generate_vault_token || var.generate_vault_token ? 1 : 0

  cluster_id = concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0] != "" ? concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0] : var.vault_cluster_name
}

// creates the hcp consul cluster
resource "hcp_consul_cluster" "consul_cluster" {
  count = var.create_consul_cluster ? 1 : 0

  cluster_id              = var.consul_cluster_name
  hvn_id                  = var.single_hvn == true ? hcp_hvn.hcp_hvn[0].hvn_id : hcp_hvn.hcp_consul_hvn[0].hvn_id
  tier                    = var.consul_tier
  size                    = var.consul_size
  public_endpoint         = var.consul_public_endpoint
  datacenter              = var.consul_datacenter != null ? var.consul_datacenter : var.consul_cluster_name
  min_consul_version      = var.min_consul_version
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

########### NEEDS TESTING

// retrieves the primary link for the federation peering.
data "hcp_consul_cluster" "primary" {
  count = var.federation ? 1 : 0

  cluster_id = var.primary_consul_cluster_name
}

// snapshots the consul cluster
resource "hcp_consul_snapshot" "snapshot" {
  count = var.snapshot_name != "" ? 1 : 0

  cluster_id    = concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] != "" ? concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0] : var.consul_cluster_name
  snapshot_name = var.snapshot_name
}
