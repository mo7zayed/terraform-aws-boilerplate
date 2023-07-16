variable "env" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type        = string
  description = "The aws region to create the infra in."
  default     = "us-east-1"
}
