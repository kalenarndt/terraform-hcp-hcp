module "hcp" {
  source               = "github.com/kalenarndt/terraform-hcp-hcp"
  region               = var.region
  vault_tier           = "dev"
  hvn_vault_cidr_block = "172.25.16.0/20"
  destination_cidr     = var.destination_cidr
  vpc_peering          = false
  transit_gateway      = true
  resource_share_arn   = var.resource_share_arn
  transit_gw_id        = var.transit_gw_id
  create_vault_cluster = true
  generate_vault_token = true
  output_vault_token   = true
}