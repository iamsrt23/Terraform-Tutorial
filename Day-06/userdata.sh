#!/bin/bash
sudo apt update
sudo apt install -y nginx git
sudo git clone https://github.com/saikiranpi/SecOps-game.git /tmp/SecOps-game
sudo rm -f /var/www/html/index.nginx-debian.html
sudo cp /tmp/SecOps-game/index.html /var/www/html/index.html
echo "<h1>${var.vpc_tag}-public-server-${count.index + 1}</h1>" | sudo tee -a /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx


# why because terrform will terminate instance first change the data to avoid this we use userdata.sh as separate file instance won't disturb
