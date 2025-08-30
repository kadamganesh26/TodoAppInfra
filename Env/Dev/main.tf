locals {
  comman_tags = {
    "managed_by" = "TodoAppTeam"
    "Owner"      = "todoApp_Team"
    "Env"        = "Dev"
  }
}

module "rg-module" {
  source   = "../../Module/Azurerm_Resource_Group"
  rg-name  = "rg-dev-todoapp"
  location = "centralindia"
  tags     = local.comman_tags
}

module "acr-module" {
  depends_on = [module.rg-module]
  source     = "../../Module/Azurerm_Container_Registry"
  acr-name   = "acrdevtodoapp"
  location   = "centralindia"
  rg-name    = "rg-dev-todoapp"
  tags       = local.comman_tags
}


module "sql-server" {
  depends_on      = [module.rg-module]
  source          = "../../Module/Azurerm_sql_Server"
  server-name     = "sql-dev-todoapp"
  location        = "centralindia"
  admin-password  = "P@55w0rd@123"
  admin-user-name = "devopsadmin"
  rg-name         = "rg-dev-todoapp"
  tags            = local.comman_tags
}


module "sql-db" {
  depends_on = [module.sql-server]
  source     = "../../Module/Azurerm_sql_database"
  db-name    = "sql-db-dev-todoapp"
  location   = "centralindia"
  rg-name    = "rg-dev-todoapp"
  server_id  = module.sql-server.server_id
  tags       = local.comman_tags
}


module "aks" {
  depends_on = [module.rg-module]
  source     = "../../Module/Azurerm_Kubernetes_Cluster"
  aks-name   = "aks-dev-todoapp"
  location   = "centralindia"
  rg-name    = "rg-dev-todoapp"
  dns_prefix = "aks-dev-todoapp"
  tags       = local.comman_tags
}


