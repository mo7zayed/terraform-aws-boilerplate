module "infrastructure" {
  source = "./modules/infrastructure"

  # AWS config
  env        = var.env
  aws_region = var.aws_region

  # Customs
  project = local.project
  global_tags = merge(
    {
      Env = var.env
    },
    local.global_tags
  )
}
