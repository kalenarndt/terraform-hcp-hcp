module "hcp" {
  source               = "github.com/kalenarndt/terraform-hcp-hcp"
  region               = var.region
  vault_tier           = "dev"
  vpc_region           = var.region
  vpc_id               = var.vpc_id
  vpc_owner_id         = var.vpc_owner_id
  destination_cidr     = var.destination_cidr
  vpc_peering          = true
  create_vault_cluster = true
  generate_vault_token = true
  output_vault_token   = true
}