
resource "azurerm_mssql_database" "example" {
  name         = var.db-name
  collation    = "SQ_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  server_id = var.server_id
  tags = var.tags
}

