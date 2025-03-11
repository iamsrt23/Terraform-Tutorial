provider "aws" {
  region = var.region

}

terraform {
  backend "s3" {
    bucket = "workspace250306"
    key    = "prod.tfstate"
    region = "us-east-1"

  }
}