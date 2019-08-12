# EKS Terraform module

module "dynamodb" {
  source   = "./modules/dynamodb"
  dynamodb = "${var.dynamodb}"
}
