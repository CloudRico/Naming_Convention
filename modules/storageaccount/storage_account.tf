locals {
  account_replication_type = local.account_replication_type_map[var.enviroment]
  account_replication_type_map = {
    dev = "LRS"
    tst = "LRS"
    qa  = "LRS"
    stg = "GRS"
    prd = "GRS"
    sec = "LRS"
  }
}
module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "storageaccount"
  application   = var.application
  instance      = var.instance
}


resource "azurerm_storage_account" "storage_account1" {
  name                       = module.conventions.name                      #module.conventions.name
  resource_group_name        = var.resource_group_name
  location                   = module.conventions.allowed_location_type
  account_tier               = var.account_tier
  account_replication_type   = local.account_replication_type

  #tags                       = var.tags
}