output "azurerm_storage_accountme" {
    value = azurerm_storage_account.storage_account1.id
}
output "name" {
  value   = azurerm_storage_account.storage_account1.name
}
output "account_tier" {
  value   = azurerm_storage_account.storage_account1.account_tier
}
output "location" {
  value = azurerm_storage_account.storage_account1.location
}
output "account_replication_type" {
  value = azurerm_storage_account.storage_account1.account_kind
}

