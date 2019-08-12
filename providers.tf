#
# Provider Configuration

 # terraform {
 #   required_version = ">= 0.11.8"
 #   backend "s3" {
 #     bucket = "terraform-state-vertafore"
 #     key    = "environment/terraform_dev.tfstate"
 #     region = "us-west-2"
 #     encrypt = true
 #   }
 # }

provider "aws" {
  region = "${var.aws-region}"
  profile = "${var.aws-profile}"
}


provider "kubernetes" {
  username = "terraform"
  version = "= 1.6.2"
}

provider "random" {
  version = "~> 2.1"
}
