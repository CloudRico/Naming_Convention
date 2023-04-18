variable "resource_group_name" {
  description = "Name of resource group it's going to be placed in."
}
variable "enviroment" {
  type = string
}
variable "instance" {}
variable "workload" {
  type = string
}
variable "application" {}
variable "address_prefixes" {}
variable"virtual_network_name" {}