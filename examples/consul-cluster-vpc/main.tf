module "hcp" {
  source                = "github.com/kalenarndt/terraform-hcp-hcp"
  region                = var.region
  consul_tier           = "development"
  consul_size           = "x_small"
  vpc_region            = var.region
  vpc_id                = var.vpc_id
  destination_cidr      = var.destination_cidr
  vpc_peering           = true
  create_consul_cluster = true
  generate_consul_token = true
  output_consul_token   = true
}