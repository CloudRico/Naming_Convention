module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "virtualmachine"
  application   = var.application
  instance      = var.instance 
}
resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                   = module.conventions.name
  resource_group_name    = var.resource_group_name
  location               = module.conventions.allowed_location_type
  size                   = var.size
  admin_username         = var.admin_username
  admin_password         = var.admin_password
  network_interface_ids  = var.network_interface_ids
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

