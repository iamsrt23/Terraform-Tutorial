resource "aws_instance" "public_server" {
  # count                       = length(var.public_cidr_block)
  count                       = var.environment == "dev" ? 3 : 1
  ami                         = lookup(var.amis, var.region)
  availability_zone           = element(var.az_1, count.index)
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.Functions-Sg.id]
  associate_public_ip_address = true

  tags = {
    Name        = "Public-Server-${count.index + 1}"
    Owner       = local.Owner
    CostCenter  = local.Owner
    TamDL       = local.TamDL
    Environment = var.environment
  }



}




resource "aws_instance" "private_server" {
  # count                       = length(var.private_cidr_block)
  count                  = var.environment == "dev" ? 3 : 1
  ami                    = lookup(var.amis, var.region)
  availability_zone      = element(var.az_1, count.index)
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = element(aws_subnet.private-subnet.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.Functions-Sg.id]


  tags = {
    Name        = "Private-Server-${count.index + 1}"
    Owner       = local.Owner
    CostCenter  = local.Owner
    TamDL       = local.TamDL
    Environment = var.environment
  }

}











