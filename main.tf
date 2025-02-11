data "azurerm_key_vault" "key_vault" {
  count               = var.key_vault_name != null ? 1 : 0
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_key_vault_key" "key_vault_key" {
  count        = var.key_vault_key_name != null ? 1 : 0
  name         = var.key_vault_key_name
  key_vault_id = data.azurerm_key_vault.key_vault[0].id
}

resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags

  public_network_access_enabled = var.public_network_access_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  retention_policy_in_days      = var.retention_policy_in_days
  trust_policy_enabled          = var.trust_policy_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
  export_policy_enabled         = var.export_policy_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option

  dynamic "georeplications" {
    for_each = var.georeplications != null ? [var.georeplications] : []
    content {
      location                  = georeplications.value.location
      regional_endpoint_enabled = georeplications.value.regional_endpoint_enabled
      zone_redundancy_enabled   = georeplications.value.zone_redundancy_enabled
      tags                      = georeplications.value.tags
    }
  }

  dynamic "network_rule_set" {
    for_each = (var.network_rule_set != null && (var.sku == "Premium")) ? [var.network_rule_set] : []
    content {
      default_action = network_rule_set.value.default_action

      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rule
        content {
          action   = ip_rule.value.action
          ip_range = ip_rule.value.ip_range
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [{}] : []

    content {
      type         = var.identity
      identity_ids = var.identity_ids
    }
  }

  dynamic "encryption" {
    for_each = var.key_vault_key_name != null ? [{}] : []

    content {
      key_vault_key_id   = data.azurerm_key_vault_key.key_vault_key[0].id
      identity_client_id = var.encryption_identity_client_id
    }
  }

}