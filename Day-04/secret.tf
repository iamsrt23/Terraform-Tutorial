
# Generate a random password for RDS
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

# Create an AWS Secret to store DB credentials
resource "aws_secretsmanager_secret" "db_secret" {
  name                    = "my-db-secret"
  description             = "Secret for my RDS database"
  recovery_window_in_days = 7
}

# Store the credentials in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "db_secret_value" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.db_password.result
  })
}

# Create an RDS Security Group
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"

  ingress {
    from_port   = 3306 # Change to 5432 for PostgreSQL
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing all IPs (Not recommended for production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_subnet_group" "db_subnet" {
  name = "prod-db-subnet-group"
  subnet_ids = [
    aws_subnet.workspaceDay3-subnet-1.id,
    aws_subnet.workspaceDay3-subnet-2.id,
    aws_route_table.workspaceDay3-RouteTable.id
  ]
  tags = {
    Name = "Production DB Subnet String"
  }

}
# Create an RDS Instance
resource "aws_db_instance" "my_rds" {
  identifier             = "my-rds-db"
  engine                 = "mysql" # Change to "postgres" for PostgreSQL
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "admin"
  password               = random_password.db_password.result
  db_subnet_group_name   = "default" # Use an existing subnet group or create one
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true # Set to false for production
}

# Output the stored secret ARN
output "rds_secret_arn" {
  value = aws_secretsmanager_secret.db_secret.arn
}

# Output the RDS endpoint
output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}
