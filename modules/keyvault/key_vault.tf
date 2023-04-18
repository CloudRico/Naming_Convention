data "azurerm_client_config" "current" {}

module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "keyvault"
  application   = var.application
  instance      = var.instance
}
resource "azurerm_key_vault" "key_vault" {
 # count                       = 3
  name                        = var.name
  #dynamic " resource_group_name " {

  #}
  resource_group_name         = var.resource_group_name

  location                    = module.conventions.allowed_location_type
  sku_name                    = var.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  #enabled_for_deployment      = true
  soft_delete_retention_days  = var.soft_delete_retention_days
}