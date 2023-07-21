variable "project" {}

variable "aws_region" {}

variable "env" {}

variable "global_tags" {}

# VPC
variable "cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "private_subnets" {
  default = ["10.0.50.0/24", "10.0.51.0/24"]
}

variable "database_subnets" {
  default = ["10.0.100.0/24", "10.0.101.0/24"]
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "alb_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "default_ami_id" {
  type = string
}

variable "key_name" {
  type = string
}
