module "hcp" {
  source                = "github.com/kalenarndt/terraform-hcp-hcp"
  region                = var.region
  consul_tier           = "development"
  consul_size           = "x_small"
  vault_tier            = "dev"
  vpc_region            = var.region
  vpc_id                = var.vpc_id
  vpc_owner_id          = var.vpc_owner_id
  destination_cidr      = var.destination_cidr
  vpc_peering           = true
  create_consul_cluster = true
  generate_consul_token = true
  output_consul_token   = true
  create_vault_cluster  = true
  generate_vault_token  = true
  output_vault_token    = true
}