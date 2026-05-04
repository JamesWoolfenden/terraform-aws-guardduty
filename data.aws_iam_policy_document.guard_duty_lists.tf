data "aws_iam_policy_document" "guard_duty_lists" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  statement {
    actions = [
      "s3:*",
    ]

    condition {
      test = "Bool"

      values = [
        "false",
      ]

      variable = "aws:SecureTransport"
    }

    effect = "Deny"

    principals {
      identifiers = [
        "*",
      ]

      type = "AWS"
    }

    resources = [
      "${element(concat(aws_s3_bucket.guard_duty_lists.*.arn, tolist([""])), 0)}",
      "${element(concat(aws_s3_bucket.guard_duty_lists.*.arn, tolist([""])), 0)}/*",
    ]

    sid = "DenyUnsecuredTransport"
  }
}
