variable "location" {
  type        = string
  description = "Azure location where resources will be created"
  validation {
    condition     = can(regex("^[A-Za-z]+ ?[A-Za-z]*$", var.location))
    error_message = "The location must be a valid Azure region name."
  }
}

variable "environment" {
  type        = string
  description = "Environment name (dev, test, staging, prd)"
  validation {
    condition     = contains(["dev", "test", "staging", "prd"], var.environment)
    error_message = "Environment must be one of: dev, test, staging, prd."
  }
}

variable "app_name" {
  type        = string
  description = "Application name - used for resource naming and tagging"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,10}$", var.app_name))
    error_message = "Application name must be 1-10 alphanumeric characters or hyphens."
  }
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID where resources will be deployed"
  validation {
    condition     = can(regex("^[a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12}$", var.subscription_id))
    error_message = "The subscription_id value must be a valid UUID."
  }
}

variable "authorized_ip_ranges" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed to access the AKS API server"
  validation {
    condition = alltrue([
      for ip in var.authorized_ip_ranges : can(cidrhost(ip, 0))
    ])
    error_message = "All authorized_ip_ranges must be valid CIDR notation, like \"10.0.0.0/24\"."
  }
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for AKS node access"
  validation {
    condition     = can(regex("^ssh-[r|d|e]sa|ed25519 [A-Za-z0-9+/]+[=]{0,3}( .+)?$", var.ssh_public_key))
    error_message = "The ssh_public_key value must be a valid public ssh key."
  }
}

variable "cluster_sku_tier" {
  type        = string
  description = "AKS cluster SKU tier (Free or Standard)"
  default     = "Free"
  validation {
    condition     = contains(["Free", "Standard"], var.cluster_sku_tier)
    error_message = "The cluster_sku_tier must be either Free or Standard."
  }
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to all resources"
  default     = {}
}
