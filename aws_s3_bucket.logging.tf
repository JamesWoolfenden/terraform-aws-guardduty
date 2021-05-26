resource "aws_s3_bucket" "logging" {
  # checkov:skip=CKV_AWS_21: ADD REASON
  # checkov:skip=CKV_AWS_144:
  # checkov:skip=CKV_AWS_145:
  #tfsec:ignore:AWS002
  #tfsec:ignore:AWS077
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = "${local.account_name}-guardduty-lists-logging"

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
