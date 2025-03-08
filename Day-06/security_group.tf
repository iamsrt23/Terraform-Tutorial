#Security Groups
resource "aws_security_group" "Functions-Sg" {
  name        = "${var.vpc_tag}-allow-all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.Functions-vpc.id

  dynamic "ingress" {
    for_each = var.ingress_service
    content {
      from_port   = ingress.value
      protocol    = "tcp"
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name       = "Functions-Sg"
    Owner      = local.Owner
    CostCenter = local.CostCenter
    TamDL      = local.TamDL

    environment = var.environment
  }
}