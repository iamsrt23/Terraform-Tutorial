# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "bumblebee2511"
  location = "South India"
}

# resource "azurerm_resource_group" "rg1" {
#   name     = "bumblebee2512"
#   location = "South India"
# }


# resource "azurerm_resource_group" "rg2" {
#   name     = "bumblebee2513"
#   location = "Central India"
# }


# resource "azurerm_resource_group" "rg3" {
#   name     = "bumblebee2514"
#   location = "Central India"
# }

resource "azurerm_storage_account" "example" {
  name                     = "bumblebee2511"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}