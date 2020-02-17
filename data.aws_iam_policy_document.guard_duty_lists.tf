data "aws_iam_policy_document" "guard_duty_lists" {
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
      "${element(concat(aws_s3_bucket.guard_duty_lists.*.arn, list("")), 0)}",
      "${element(concat(aws_s3_bucket.guard_duty_lists.*.arn, list("")), 0)}/*",
    ]

    sid = "DenyUnsecuredTransport"
  }
}
