variable "volume_lookup" {
  description = <<EOT
Map of volume_lookup, attributes below
Required:
    - name
Optional:
    - provider_config (block):
        - workspace_id (optional)
    - volume_info (block):
        - access_point (optional)
        - browse_only (optional)
        - catalog_name (optional)
        - comment (optional)
        - created_at (optional)
        - created_by (optional)
        - encryption_details (optional, block):
            - sse_encryption_details (optional, block):
                - algorithm (optional)
                - aws_kms_key_arn (optional)
        - full_name (optional)
        - metastore_id (optional)
        - name (optional)
        - owner (optional)
        - schema_name (optional)
        - storage_location (optional)
        - updated_at (optional)
        - updated_by (optional)
        - volume_id (optional)
        - volume_type (optional)
EOT

  type = map(object({
    name = string
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    volume_info = optional(object({
      access_point = optional(string)
      browse_only  = optional(bool)
      catalog_name = optional(string)
      comment      = optional(string)
      created_at   = optional(number)
      created_by   = optional(string)
      encryption_details = optional(object({
        sse_encryption_details = optional(object({
          algorithm       = optional(string)
          aws_kms_key_arn = optional(string)
        }))
      }))
      full_name        = optional(string)
      metastore_id     = optional(string)
      name             = optional(string)
      owner            = optional(string)
      schema_name      = optional(string)
      storage_location = optional(string)
      updated_at       = optional(number)
      updated_by       = optional(string)
      volume_id        = optional(string)
      volume_type      = optional(string)
    }))
  }))
}

