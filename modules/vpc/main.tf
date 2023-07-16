# Create VPC Terraform Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # VPC Basic Details
  name            = "${var.project}-${var.env}-vpc"
  cidr            = var.cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  # Database Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = var.database_subnets

  # NAT Gateways - Outbound Communication
  #   single_nat_gateway = true
  enable_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  tags = merge(
    {
      Env = var.env
    },
    var.global_tags
  )

  public_subnet_tags = merge(
    {
      Type = "public-subnets"
    },
    var.global_tags
  )

  private_subnet_tags = merge(
    {
      Type = "private-subnets"
    },
    var.global_tags
  )

  database_subnet_tags = merge(
    {
      Type = "database-subnets"
    },
    var.global_tags
  )
}
