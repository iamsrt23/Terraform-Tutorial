output "vpc_tag" {
  value = var.vpc_tag
}

output "vpc_id" {
  value = aws_vpc.module_vpc.id
}

output "environment" {
  value = var.environment
}

output "public_subnet" {
  value = aws_subnet.public-subnets.*.id
  
}

output "private_subnet" {
  value = aws_subnet.private-subnets.*.id
}

output "public_cidr" {
  value = var.public_cidr
}

output "private_cidr" {
  value = var.private_cidr
}

