resource "aws_instance" "public_instance" {
  count = length(var.public_cidr)
  ami  = lookup(var.amis,var.region)
  instance_type = "t2.micro"
  key_name = var.key_name
  subnet_id = element(var.public_subnet,count.index)
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  tags = {
    Name = "${var.vpc_tag}-Public-Server-${count.index+1}"
    environment = var.environment

  }
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx git
  sudo git clone https://github.com/saikiranpi/SecOps-game.git /tmp/SecOps-game
  sudo rm -f /var/www/html/index.nginx-debian.html
  sudo cp /tmp/SecOps-game/index.html /var/www/html/index.html
  echo "<h1>${var.vpc_tag}-public-server-${count.index + 1}</h1>" | sudo tee -a /var/www/html/index.html
  sudo systemctl start nginx
  sudo systemctl enable nginx
EOF
}