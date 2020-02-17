# terraform-aws-guardduty

Sets up guard duty in the Master account with trusted IP and threat lists, can invite member accounts
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| account\_name | The account name. Used as a prefix to name resources. | `string` | `""` | no |
| common\_tags | n/a | `map` | n/a | yes |
| enable | Enable/Disable guardduty.You can set the enable attribute to false for suspend monitoring and feedback reporting while keeping existing data. | `bool` | `true` | no |
| ip\_set\_active | Specifies whether GuardDuty is to start using the uploaded IPSet | `string` | `false` | no |
| ip\_set\_format | The format of the file that contains the IPSet. Valid values: TXT \| STIX \| OTX\_CSV \| ALIEN\_VAULT \| PROOF\_POINT \| FIRE\_EYE | `string` | `"TXT"` | no |
| ip\_set\_list\_path | The path of the IP safe list file | `string` | `""` | no |
| log\_bucket | Account level Log bucket id | `string` | n/a | yes |
| member\_list | The list of member accounts to be added. Each member list need to have values of account\_id, member\_email and invite boolean | `list` | `[]` | no |
| member\_list\_count | The count of members to be added to this master guard duty | `string` | `0` | no |
| threat\_intel\_list\_path | The path of the Threat intel file | `string` | `""` | no |
| threat\_intel\_set\_active | Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet | `string` | `false` | no |
| threat\_intel\_set\_format | The format of the file that contains the ThreatIntelSet. Valid values: TXT \| STIX \| OTX\_CSV \| ALIEN\_VAULT \| PROOF\_POINT \| FIRE\_EYE | `string` | `"TXT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| GuardDuty | The GuardDuty detector |

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

## Copyrights

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-staticsite&url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-staticsite
[share_email]: mailto:?subject=terraform-aws-staticsite&body=https://github.com/JamesWoolfenden/terraform-aws-staticsite
