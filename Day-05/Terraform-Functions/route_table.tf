resource "aws_route_table_association" "Public-RTA" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.public-RouteTable.id

}


resource "aws_route_table_association" "Private_RTA" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private-RouteTable.id

}