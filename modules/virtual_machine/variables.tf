variable "resource_group_name" {
  description = "Name of resource group it's going to be placed in."
}
variable "admin_username" {}
variable "admin_password" {}
variable "size" {}
variable "network_interface_ids" {}
variable "instance" {}

variable "enviroment" {
  type = string
}
variable "workload" {
  type = string
}
variable "application" {}