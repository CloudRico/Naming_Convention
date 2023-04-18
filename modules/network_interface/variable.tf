variable "application" {}
variable "workload" {}
variable "enviroment" {}
variable "resource_group_name" {}
variable "ip_config_name" { default = "ipConfig" }
variable "subnet_id" {}
variable "private_ip_address_allocation" { default = "Dynamic" }
variable "instance" {}