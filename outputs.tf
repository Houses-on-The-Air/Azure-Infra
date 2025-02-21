output "abbr" {
  value = local.region_abbr
}

output "mgmt-cluster" {
  value = "azurerm_kubernetes_cluster.aks[0].name"
  description = "value of the management cluster name"
}

output "app-cluster" {
  value = "azurerm_kubernetes_cluster.aks[1].name"
  description = "value of the application cluster name"
}

output "mgmt-cluster-rg" {
  value = "azurerm_kubernetes_cluster.aks[0].resource_group_name"
  description = "value of the management cluster resource group name"
}

output "app-cluster-rg" {
  value = "azurerm_kubernetes_cluster.aks[1].resource_group_name"
  description = "value of the application cluster resource group name"
}

output "mgmt-cluster-loc" {
  value = "azurerm_kubernetes_cluster.aks[0].location"
  description = "value of the management cluster location"
}

output "app-cluster-loc" {
  value = "azurerm_kubernetes_cluster.aks[1].location"
  description = "value of the application cluster location"
}

output "mgmt-cluster-dns" {
  value = "azurerm_kubernetes_cluster.aks[0].dns_prefix"
  description = "value of the management cluster dns prefix"
}

output "app-cluster-dns" {
  value = "azurerm_kubernetes_cluster.aks[1].dns_prefix"
  description = "value of the application cluster dns prefix"
}

output "mgmt-cluster-vm-size" {
  value = "azurerm_kubernetes_cluster.aks[0].default_node_pool.0.vm_size"
  description = "value of the management cluster vm size"
}

output "app-cluster-vm-size" {
  value = "azurerm_kubernetes_cluster.aks[1].default_node_pool.0.vm_size"
  description = "value of the application cluster vm size"
}

output "mgmt-cluster-node-count" {
  value = "azurerm_kubernetes_cluster.aks[0].default_node_pool.0.node_count"
  description = "value of the management cluster node count"
}

output "app-cluster-node-count" {
  value = "azurerm_kubernetes_cluster.aks[1].default_node_pool.0.node_count"
  description = "value of the application cluster node count"
}

output "mgmt-cluster-identity" {
  value = "azurerm_kubernetes_cluster.aks[0].identity.0.type"
  description = "value of the management cluster identity"
}

output "app-cluster-identity" {
  value = "azurerm_kubernetes_cluster.aks[1].identity.0.type"
  description = "value of the application cluster identity"
}

output "mgmt-cluster-network-plugin" {
  value = "azurerm_kubernetes_cluster.aks[0].network_profile.0.network_plugin"
  description = "value of the management cluster network plugin"
}

output "app-cluster-network-plugin" {
  value = "azurerm_kubernetes_cluster.aks[1].network_profile.0.network_plugin"
  description = "value of the application cluster network plugin"
}

output "mgmt-cluster-network-policy" {
  value = "azurerm_kubernetes_cluster.aks[0].network_profile.0.network_policy"
  description = "value of the management cluster network policy"
}

output "app-cluster-network-policy" {
  value = "azurerm_kubernetes_cluster.aks[1].network_profile.0.network_policy"
  description = "value of the application cluster network policy"
}
