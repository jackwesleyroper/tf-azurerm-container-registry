output "container_registry_id" {
  value       = azurerm_container_registry.acr.id
  description = "The ID of the Container Registry."
}

output "container_registry_name" {
  value       = azurerm_container_registry.acr.name
  description = "The name of the Container Registry."
}