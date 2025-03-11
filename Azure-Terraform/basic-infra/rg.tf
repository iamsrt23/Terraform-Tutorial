# Create resource groups
resource "azurerm_resource_group" "example" {
  for_each = toset(var.resource_group)
  name     = each.value
  location = var.location
}

# Create storage accounts
resource "azurerm_storage_account" "bumblebee251" {
  for_each = toset(var.storage_account)

  name                     = each.value
  resource_group_name      = azurerm_resource_group.example[element(var.resource_group, index(var.storage_account, each.key))].name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

# Create storage containers
resource "azurerm_storage_container" "storage2" {
  for_each = azurerm_storage_account.bumblebee251

  name                  = "container-${each.key}"
  storage_account_name  = each.value.name
  container_access_type = "private"
}