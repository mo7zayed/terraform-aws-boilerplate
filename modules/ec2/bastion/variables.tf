variable "project" {}

variable "aws_region" {}

variable "env" {}

variable "global_tags" {}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}
