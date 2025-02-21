output "abbr" {
  value = local.region_abbr
}

output "mgmt-cluster" {
  value = "azurerm_kubernetes_cluster.aks[0].name"
}

output "app-cluster" {
  value = "azurerm_kubernetes_cluster.aks[1].name"
}

output "mgmt-cluster-rg" {
  value = "azurerm_kubernetes_cluster.aks[0].resource_group_name"
}

output "app-cluster-rg" {
  value = "azurerm_kubernetes_cluster.aks[1].resource_group_name"
}

output "mgmt-cluster-loc" {
  value = "azurerm_kubernetes_cluster.aks[0].location"
}

output "app-cluster-loc" {
  value = "azurerm_kubernetes_cluster.aks[1].location"
}

output "mgmt-cluster-dns" {
  value = "azurerm_kubernetes_cluster.aks[0].dns_prefix"
}

output "app-cluster-dns" {
  value = "azurerm_kubernetes_cluster.aks[1].dns_prefix"
}

output "mgmt-cluster-vm-size" {
  value = "azurerm_kubernetes_cluster.aks[0].default_node_pool.0.vm_size"
}

output "app-cluster-vm-size" {
  value = "azurerm_kubernetes_cluster.aks[1].default_node_pool.0.vm_size"
}

output "mgmt-cluster-node-count" {
  value = "azurerm_kubernetes_cluster.aks[0].default_node_pool.0.node_count"
}

output "app-cluster-node-count" {
  value = "azurerm_kubernetes_cluster.aks[1].default_node_pool.0.node_count"
}

output "mgmt-cluster-identity" {
  value = "azurerm_kubernetes_cluster.aks[0].identity.0.type"
}

output "app-cluster-identity" {
  value = "azurerm_kubernetes_cluster.aks[1].identity.0.type"
}

output "mgmt-cluster-network-plugin" {
  value = "azurerm_kubernetes_cluster.aks[0].network_profile.0.network_plugin"
}

output "app-cluster-network-plugin" {
  value = "azurerm_kubernetes_cluster.aks[1].network_profile.0.network_plugin"
}

output "mgmt-cluster-network-policy" {
  value = "azurerm_kubernetes_cluster.aks[0].network_profile.0.network_policy"
}

output "app-cluster-network-policy" {
  value = "azurerm_kubernetes_cluster.aks[1].network_profile.0.network_policy"
}
