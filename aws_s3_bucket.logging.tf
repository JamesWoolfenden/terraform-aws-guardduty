resource "aws_s3_bucket" "logging" {
  # checkov:skip=CKV2_AWS_61: Lifecycle configuration not required for this bucket
  # checkov:skip=CKV2_AWS_62: Event notifications not required for this bucket
  # checkov:skip=CKV_AWS_21: ADD REASON
  # checkov:skip=CKV_AWS_144:
  # checkov:skip=CKV_AWS_145:
  # checkov:skip=CKV2_AWS_37: iTs already a logging bucket
  # checkov:skip=CKV_AWS_18: this is the logging bucket
  # checkov:skip=CKV2_AWS_6: public access block via aws_s3_bucket_public_access_block.logging
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = "${local.account_name}-guardduty-lists-logging"

  lifecycle {
    prevent_destroy = true
  }

}
resource "aws_s3_bucket_server_side_encryption_configuration" "logging" {
  count  = (var.threat_intel_list_path == "") && (var.ip_set_list_path == "") ? 0 : 1
  bucket = aws_s3_bucket.logging[0].bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
