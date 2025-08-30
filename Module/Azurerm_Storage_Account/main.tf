

resource "azurerm_storage_account" "st-account" {
  name                     = var.sa-name
  resource_group_name      = var.rg-name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags
}