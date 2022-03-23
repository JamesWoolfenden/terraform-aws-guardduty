resource "aws_s3_bucket" "guard_duty_lists" {
  # checkov:skip=CKV_AWS_144:
  # checkov:skip=CKV_AWS_145:

  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = "${local.account_name}-guardduty-lists"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_logging" "guard_duty_lists" {
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = aws_s3_bucket.guard_duty_lists[0].id

  target_bucket = aws_s3_bucket.logging[0].id
  target_prefix = "s3/guard_duty/"
}

resource "aws_s3_bucket_versioning" "guard_duty_lists" {
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = aws_s3_bucket.guard_duty_lists[0].id
  versioning_configuration {
    status     = "Enabled"
    mfa_delete = var.mfa_delete
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "guard_duty_lists" {
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = aws_s3_bucket.guard_duty_lists[0].bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
