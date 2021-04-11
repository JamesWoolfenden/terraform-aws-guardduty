resource "aws_s3_bucket" "guard_duty_lists" {
  # checkov:skip=CKV_AWS_144:
  # checkov:skip=CKV_AWS_145:

  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = "${local.account_name}-guardduty-lists"

  lifecycle {
    prevent_destroy = true
  }

  logging {
    target_bucket = data.aws_s3_bucket.log_bucket.id
    target_prefix = "s3/guard_duty/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled    = true
    mfa_delete = var.mfa_delete
  }
}
