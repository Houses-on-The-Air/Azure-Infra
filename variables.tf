variable "location" {
  type        = string
  description = "Azure location"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "app_name" {
  type        = string
  description = "Application name"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"

}

variable "authorized_ip_ranges" {
  type        = list(string)
  description = "Authorized IP ranges"

}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
}

variable "cluster_sku_tier" {
  type        = string
  description = "SKU tier for the cluster"
}
