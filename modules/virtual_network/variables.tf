variable "resource_group_name" {
  description = "Name of resource group it's going to be placed in."
}
variable "enviroment" {
  type = string
}
variable "workload" {
  type = string
}
variable "instance" {}
variable "application" {}
variable "address_space" {}