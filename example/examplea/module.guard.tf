module "guard" {
  source     = "../../"
  log_bucket = var.log_bucket
  kms_key    = aws_kms_key.example
}
