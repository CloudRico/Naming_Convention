module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "virtualnetwork"
  application   = var.application
  instance      = var.instance 
}
resource "azurerm_virtual_network" "azurerm_virtual_network" {
  address_space        = var.address_space
  #dns_servers          = var.take_azure_dns == true ? null : module.conventions.environment_specific_domain_dns_servers
  #dns_servers          = var.take_azure_dns
  location             = module.conventions.allowed_location_type
  name                 = module.conventions.name
  resource_group_name  = var.resource_group_name
}