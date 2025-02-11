variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group, where the resources will be deployed."
}

variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}

variable "container_registry_name" {
  type        = string
  description = "The name of the Container Registry. Changing this forces a new resource to be created."
}

variable "sku" {
  type        = string
  description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium. Classic (which was previously Basic) is supported only for existing resources."
}

variable "admin_enabled" {
  type        = bool
  description = "Specifies whether the admin user is enabled. Defaults to false."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = {}
}

variable "public_network_access_enabled" {
  default = true
}

variable "quarantine_policy_enabled" {
  default = null
}

variable "retention_policy_in_days" {
  description = "(Optional) The number of days to retain and untagged manifest after which it gets purged. Defaults to 7."
  default     = 7
}

variable "trust_policy_enabled" {
  description = "(Optional) Boolean value that indicated whether trust policy is enabled. Defaults to false."
  default     = false
}

variable "zone_redundancy_enabled" {
  default = false
}

variable "export_policy_enabled" {
  default = true
}

variable "anonymous_pull_enabled" {
  default = null
}

variable "data_endpoint_enabled" {
  default = null
}

variable "network_rule_bypass_option" {
  default = "AzureServices"
}

variable "georeplications" {
  default = null
}

variable "network_rule_set" {
  default = null
}

variable "retention_policy" {
  default = null
}

variable "trust_policy_enabled" {
  default = null
}

variable "identity" {
  default = null
}

variable "identity_ids" {
  default = null
}

variable "encryption_enabled" {
  default = null
}

variable "key_vault_name" {
  default = null
}

variable "key_vault_resource_group_name" {
  default = null
}

variable "key_vault_key_name" {
  default = null
}

variable "encryption_identity_client_id" {
  default = null
}