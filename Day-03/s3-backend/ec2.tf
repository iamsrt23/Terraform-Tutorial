# # EC2 Instance
# resource "aws_instance" "web-1" {
#   ami                         = "ami-0866a3c8686eaeeba"
#   availability_zone           = var.ec2_az
#   instance_type               = "t2.micro"
#   key_name                    = var.key_name
#   subnet_id                   = aws_subnet.workspaceDay3-subnet-1.id
#   vpc_security_group_ids      = [aws_security_group.workspaceDay3-SG.id]
#   associate_public_ip_address = true

#   tags = {
#     Name       = "${var.env}-server"
#     Env        = var.env
#     Owner      = "teja"
#     CostCenter = "ABCD"
#   }

#   user_data = <<-EOF
#   #!/bin/bash
#   sudo apt-get update
#   sudo apt-get install -y nginx
#   echo "<h1>${var.env}-Server-1</h1>" | sudo tee /var/www/html/index.html
#   sudo systemctl start nginx
#   sudo systemctl enable nginx
#   EOF
# }
