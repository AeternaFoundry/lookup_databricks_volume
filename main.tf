data "databricks_volume" "volume_lookup" {
  for_each = var.volume_lookup

  name = each.value.name

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "volume_info" {
    for_each = each.value.volume_info != null ? [each.value.volume_info] : []
    content {
      access_point = volume_info.value.access_point
      browse_only  = volume_info.value.browse_only
      catalog_name = volume_info.value.catalog_name
      comment      = volume_info.value.comment
      created_at   = volume_info.value.created_at
      created_by   = volume_info.value.created_by
      dynamic "encryption_details" {
        for_each = volume_info.value.encryption_details != null ? [volume_info.value.encryption_details] : []
        content {
          dynamic "sse_encryption_details" {
            for_each = encryption_details.value.sse_encryption_details != null ? [encryption_details.value.sse_encryption_details] : []
            content {
              algorithm       = sse_encryption_details.value.algorithm
              aws_kms_key_arn = sse_encryption_details.value.aws_kms_key_arn
            }
          }
        }
      }
      full_name        = volume_info.value.full_name
      metastore_id     = volume_info.value.metastore_id
      name             = volume_info.value.name
      owner            = volume_info.value.owner
      schema_name      = volume_info.value.schema_name
      storage_location = volume_info.value.storage_location
      updated_at       = volume_info.value.updated_at
      updated_by       = volume_info.value.updated_by
      volume_id        = volume_info.value.volume_id
      volume_type      = volume_info.value.volume_type
    }
  }
}

