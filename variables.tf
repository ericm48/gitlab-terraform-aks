variable "location" {
  type        = string
  description = "Azure regional location"
  default     = "eastus"
}

variable "cluster_name" {
  type        = string
  default     = "gitlab-terraform-aks"
  description = "AKS Cluster name"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.26"
  description = "Kubernetes version"
}

variable "create_resource_group" {
  type        = bool
  description = "Enable or not the resource group creation"
  default     = true
}

variable "resource_group_name" {
  type        = string
  description = "Resource group Name"
  default     = null
}

variable "agent_namespace" {
  default     = "gitlab-agent"
  description = "Kubernetes namespace to install the Agent"
}

variable "agent_token" {
  description = "Agent token (provided after registering an Agent in GitLab)"
  sensitive   = true
}

variable "kas_address" {
  description = "Agent Server address (provided after registering an Agent in GitLab)"
}
