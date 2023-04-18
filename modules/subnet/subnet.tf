module "conventions" {
  source         = "../conventions"

  application    = var.application
  enviroment     = var.enviroment
  resource_type  = "subnet"
  workload       = var.workload
  instance       = var.instance
}
resource "azurerm_subnet" "subnet"{
  address_prefixes                               = var.address_prefixes
  name                                           = module.conventions.name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
}