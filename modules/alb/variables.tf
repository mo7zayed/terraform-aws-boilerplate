variable "project" {}

variable "aws_region" {}

variable "env" {}

variable "global_tags" {}

variable "alb_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
}

variable "default_ami_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}
