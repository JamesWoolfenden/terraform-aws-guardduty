provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      createdby = "terraform"
      module    = "terraform-aws-guardduty"
      owner     = "James Woolfenden"
    }
  }
}
