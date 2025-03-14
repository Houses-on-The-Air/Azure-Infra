locals {
  region_abbr = module.region-abbreviation-mapping.az_region_abbr_map[var.location]

  # Common tags for all resources
  common_tags = merge(
    var.tags,
    {
      environment = var.environment
      application = var.app_name
      managed_by  = "terraform"
      created_on  = timestamp()
    }
  )

}
