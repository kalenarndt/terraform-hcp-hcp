module "hcp" {
  source                = "../../"
  region                = "us-west-2"
  boundary_cluster_name = "hcp-boundary"
  boundary_user         = "kalen"
  boundary_password     = "SuperDuperPassword1!"
}
