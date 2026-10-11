output "volume_lookup_id" {
  description = "Map of id values across all volume_lookup, keyed the same as var.volume_lookup except keys with no id are omitted"
  value       = { for k, v in data.databricks_volume.volume_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "volume_lookup_name" {
  description = "Map of name values across all volume_lookup, keyed the same as var.volume_lookup except keys with no name are omitted"
  value       = { for k, v in data.databricks_volume.volume_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "volume_lookup_provider_config" {
  description = "Map of provider_config values across all volume_lookup, keyed the same as var.volume_lookup except keys with no provider_config are omitted"
  value       = { for k, v in data.databricks_volume.volume_lookup : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "volume_lookup_volume_info" {
  description = "Map of volume_info values across all volume_lookup, keyed the same as var.volume_lookup except keys with no volume_info are omitted"
  value       = { for k, v in data.databricks_volume.volume_lookup : k => one(v.volume_info) if v.volume_info != null && length(v.volume_info) > 0 }
}

