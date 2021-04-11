# terraform-aws-guardduty

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-guardduty/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-guardduty)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-guardduty.svg)](https://github.com/JamesWoolfenden/terraform-aws-guardduty/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-guardduty.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-guardduty/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-guardduty/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-guardduty&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-guardduty/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-guardduty&benchmark=INFRASTRUCTURE+SECURITY)

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Introduction

Sets up guard duty in the Master account with trusted IP and threat lists, can invite member accounts
forked from git@github.com:QuiNovas/terraform-aws-guardduty.git

<https://aws.amazon.com/guardduty/>

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_detector.master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_guardduty_ipset.MyIPSet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_ipset) | resource |
| [aws_guardduty_member.members](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_member) | resource |
| [aws_guardduty_threatintelset.MyThreatIntelSet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_threatintelset) | resource |
| [aws_s3_bucket.guard_duty_lists](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.MyIPSet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.MyThreatIntelSet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_policy.guard_duty_lists](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.guard_duty_lists](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.log_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The account name. Used as a prefix to name resources. | `string` | `""` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_enable"></a> [enable](#input\_enable) | Enable/Disable guardduty.You can set the enable attribute to false for suspend monitoring and feedback reporting while keeping existing data. | `bool` | `true` | no |
| <a name="input_ip_set_active"></a> [ip\_set\_active](#input\_ip\_set\_active) | Specifies whether GuardDuty is to start using the uploaded IPSet | `string` | `false` | no |
| <a name="input_ip_set_format"></a> [ip\_set\_format](#input\_ip\_set\_format) | The format of the file that contains the IPSet. Valid values: TXT \| STIX \| OTX\_CSV \| ALIEN\_VAULT \| PROOF\_POINT \| FIRE\_EYE | `string` | `"TXT"` | no |
| <a name="input_ip_set_list_path"></a> [ip\_set\_list\_path](#input\_ip\_set\_list\_path) | The path of the IP safe list file | `string` | `""` | no |
| <a name="input_log_bucket"></a> [log\_bucket](#input\_log\_bucket) | Account level Log bucket id | `string` | n/a | yes |
| <a name="input_member_list"></a> [member\_list](#input\_member\_list) | The list of member accounts to be added. Each member list need to have values of account\_id, member\_email and invite boolean | `list(any)` | `[]` | no |
| <a name="input_member_list_count"></a> [member\_list\_count](#input\_member\_list\_count) | The count of members to be added to this master guard duty | `string` | `0` | no |
| <a name="input_mfa_delete"></a> [mfa\_delete](#input\_mfa\_delete) | n/a | `bool` | `true` | no |
| <a name="input_threat_intel_list_path"></a> [threat\_intel\_list\_path](#input\_threat\_intel\_list\_path) | The path of the Threat intel file | `string` | `""` | no |
| <a name="input_threat_intel_set_active"></a> [threat\_intel\_set\_active](#input\_threat\_intel\_set\_active) | Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet | `string` | `false` | no |
| <a name="input_threat_intel_set_format"></a> [threat\_intel\_set\_format](#input\_threat\_intel\_set\_format) | The format of the file that contains the ThreatIntelSet. Valid values: TXT \| STIX \| OTX\_CSV \| ALIEN\_VAULT \| PROOF\_POINT \| FIRE\_EYE | `string` | `"TXT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_GuardDuty"></a> [GuardDuty](#output\_GuardDuty) | The GuardDuty detector |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Instructions

## Related Projects

Check out these related projects.

- [terraform-aws-statebucket](https://github.com/jameswoolfenden/terraform-aws-statebucket) - Terraform s3 state buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-staticsite/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-staticsite/issues) to report any bugs or file feature requests.

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_email]: mailto:?subject=terraform-aws-staticsite&body=https://github.com/JamesWoolfenden/terraform-aws-staticsite
