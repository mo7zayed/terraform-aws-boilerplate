module "vpc" {
  source = "../vpc"

  # AWS config
  env        = var.env
  aws_region = var.aws_region

  # Customs
  project     = var.project
  global_tags = var.global_tags

  # VPC
  cidr             = var.cidr
  azs              = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets
}
