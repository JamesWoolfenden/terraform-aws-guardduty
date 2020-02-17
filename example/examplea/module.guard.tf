module "guard" {
  source              = "../../"
  common_tags         = var.common_tags
  log_bucket=var.log_bucket
}
