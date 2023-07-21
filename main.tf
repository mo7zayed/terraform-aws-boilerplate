module "infrastructure" {
  source = "./modules/_infrastructure"

  # AWS config
  env        = var.env
  aws_region = var.aws_region

  # Customs
  project        = local.project
  default_ami_id = data.aws_ami.ec2_instance_ami.id
  key_name       = var.key_name
  global_tags = merge(
    {
      Env = var.env
    },
    local.global_tags
  )
}
