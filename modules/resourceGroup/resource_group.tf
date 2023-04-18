module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  instance      = var.instance
  resource_type = "resourcegroup"
  application   = var.application
}




resource "azurerm_resource_group" "resource_group" {                       #for_each = {for x in local.resourcegroup : x. => x }
    name                     = module.conventions.name
    location                 = module.conventions.allowed_location_type
}