
# Generate a random password for RDS
resource "random_password" "db_password" {
  length           = 16
  special         = true
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
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.db_password.result
  })
}
