resource "aws_security_group" "bastion_sg" {
  name        = "bastion-server-sg"
  description = "Allow incoming SSH connections"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags
  tags = merge(
    {
      Env = var.env
    },
    var.global_tags
  )
}

module "bastion-server" {
  source = "terraform-aws-modules/ec2-instance/aws"

  depends_on = [aws_security_group.bastion_sg]


  name                        = "${var.project}-${var.env}-bastion-server"
  ami                         = var.default_ami_id
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = var.key_name
  #   monitoring                  = true

  # Tags
  tags = merge(
    {
      Env = var.env
    },
    var.global_tags
  )
}
