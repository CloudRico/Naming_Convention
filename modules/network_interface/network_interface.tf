module "conventions" {
  source        = "../conventions"
  enviroment   = var.enviroment
  workload      = var.workload
  instance      = var.instance
  resource_type = "networkinterface"
  application = var.application
}
resource "azurerm_network_interface" "network_interface" {

  name                = module.conventions.name
  location            = module.conventions.allowed_location_type
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

}