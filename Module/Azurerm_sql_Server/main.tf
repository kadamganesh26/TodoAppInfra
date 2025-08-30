resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server-name
  resource_group_name          = var.rg-name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin-user-name
  administrator_login_password = var.admin-password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = var.tags
}