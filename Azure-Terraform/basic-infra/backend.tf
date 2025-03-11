terraform {
  backend "azurerm" {
    resource_group_name = "bumblebee"
    storage_account_name = "bumblebee250305"
    container_name = "terraform"
    key = "stagimg.terraform.tfstate"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform"
    key = "staging.tfstate"
    region = "us-east-1"
    
  }
}