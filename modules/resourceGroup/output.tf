
output "enviroment" {
  value = var.enviroment
}
output "workload" {
  value = var.workload
}
output "application" {
  value = var.application
}
#output "name" {
#    value = [ for resource_group in resource.azurerm_resource_group.resource_group : resource_group.name ]
#}
output "name" {
  value = azurerm_resource_group.resource_group.name
}