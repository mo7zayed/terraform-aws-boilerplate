locals {
  instances = {
    i-00 = {
      instance_type = var.alb_instance_type
      subnet_id     = var.private_subnets[0]
    }
    i-01 = {
      instance_type = var.alb_instance_type
      subnet_id     = var.private_subnets[1]
    }
  }
}

# Define the security group for the Linux server
resource "aws_security_group" "ec2_sg" {
  name        = "${var.project}-${var.env}-ec2-sg"
  description = "Allow incoming HTTP connections from ALB"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.project}-${var.env}-ec2-sg"
      Env  = var.env
    },
    var.global_tags
  )
}

resource "aws_security_group_rule" "alb_ec2_traffic" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

# Create EC2 Instances
resource "aws_instance" "alb_nodes" {
  for_each = local.instances

  ami                         = var.default_ami_id
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = false
  source_dest_check           = false
  key_name                    = var.key_name
  user_data                   = file("${path.module}/scripts/nginx.sh")

  tags = merge(
    {
      Name = each.key
      Env  = var.env
    },
    var.global_tags
  )
}
