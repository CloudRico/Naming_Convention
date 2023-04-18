locals {
  default_network_inbound_rules = {
    default_inbound = {
      name                       = "application_gateway_health_check_inbound"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "65200-65535"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }


  inbound_security_rules = merge(local.default_network_inbound_rules, var.network_security_group_inbound_rules)

  default_network_outbound_rules = {
    default_outbound = {
      name                       = "application_gateway_health_check_outbound"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "65200-65535"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  outbound_security_rules = merge(local.default_network_outbound_rules, var.network_security_group_outbound_rules)
}




module "conventions" {
  source        = "../conventions"
  enviroment    = var.enviroment
  workload      = var.workload
  resource_type = "networksecuritygroup"
  application   = var.application
  instance      =  var.instance
}
resource "azurerm_network_security_group" "nsg1" {
  name                 = module.conventions.name
  location             = module.conventions.allowed_location_type
  resource_group_name  = var.resource_group_name
    dynamic "security_rule" {
      for_each = local.inbound_security_rules
      content {
        name                         =  security_rule.value["name"]
        priority                     =  security_rule.value["priority"]
        access                       =  security_rule.value["access"]
        protocol                     =  security_rule.value["protocol"]
        direction                    = "Inbound"
        source_port_range            =  security_rule.value["source_address_prefix"]
        destination_port_range       =  security_rule.value["destination_port_range"]
        source_address_prefix        =  security_rule.value["source_address_prefix"]
        destination_address_prefix   =  security_rule.value["destination_address_prefix"]
      }
    }
    dynamic "security_rule" {
      for_each = local.outbound_security_rules
      content {
        name                         =  security_rule.value["name"]
        priority                     =  security_rule.value["priority"]
        access                       =  security_rule.value["access"]
        protocol                     =  security_rule.value["protocol"]
        direction                    = "Outbound"
        source_port_range            =  security_rule.value["source_address_prefix"]
        destination_port_range       =  security_rule.value["destination_port_range"]
        source_address_prefix        =  security_rule.value["source_address_prefix"]
        destination_address_prefix   =  security_rule.value["destination_address_prefix"]
      }
    }
}