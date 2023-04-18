
  locals {
  resource_name_type = local.resource_name_type_map[var.resource_type]
  resource_name_type_map = {
    resourcegroup        = lower(join("-",compact(["rg",var.instance,var.workload,local.allowed_location_type,var.enviroment,])))
    storageaccount       = lower(join("",compact(["stg",var.instance,var.workload,local.allowed_location_type,var.enviroment,])))
    keyvault             =  lower(join("-",compact(["kvl",var.instance,var.workload,local.allowed_location_type,var.enviroment]))),
    virtualmachine       = lower(join("-",compact(["vm",var.instance,var.workload,local.allowed_location_type,var.enviroment])))
    virtualnetwork       = lower(join("-",compact(["vnt",var.instance,var.workload,local.allowed_location_type,var.enviroment])))
    subnet               = lower(join("-",compact(["snt",var.instance,var.workload,local.location_short,var.enviroment])))
    networkinterface     = lower(join("-",compact(["nic",var.instance,var.workload,local.location_short,var.enviroment])))
    networksecuritygroup = lower(join("-",compact(["nsg",var.instance,var.workload,local.location_short,var.enviroment])))
  }
  allowed_location_type= local.allowed_location_type_map[var.enviroment]
  allowed_location_type_map = {
    dev = "westus"
    sec = "westus"
    stg = "centralus"
    prod = "eastus"



  }
  location_short = local.location_short_type[local.allowed_location_type]
  location_short_type = {
    westus = "wus"
    centralus = "cus"
    eastus = "eus"
  }
  }


