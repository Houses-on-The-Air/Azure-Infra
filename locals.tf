locals {
  region_abbr = module.region-abbreviation-mapping.az_region_abbr_map[var.location]
}
