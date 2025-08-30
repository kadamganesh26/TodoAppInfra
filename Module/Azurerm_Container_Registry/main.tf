
resource "azurerm_container_registry" "acr" {
  name                = var.acr-name
  resource_group_name = var.rg-name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = var.tags
  }
}