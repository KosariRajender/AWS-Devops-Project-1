resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Security group for my EC2 instance"
  vpc_id      = data.aws_vpc.default.id
// these piece of code is calling the values from variables.tf 31-71
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.allowed_egress_ports
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "nginx-security-group"
  }
}
