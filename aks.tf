resource "random_id" "prefix" {
  byte_length = 8
}

resource "random_id" "name" {
  byte_length = 8
}

resource "azurerm_resource_group" "main" {
  count = var.create_resource_group ? 1 : 0

  location = var.location
  name     = coalesce(var.resource_group_name, "${random_id.prefix.hex}-rg")
}

locals {
  resource_group = {
    name     = var.create_resource_group ? azurerm_resource_group.main[0].name : var.resource_group_name
    location = var.location
  }
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "7.1.0"

  prefix              = random_id.name.hex
  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  resource_group_name = local.resource_group.name

  rbac_aad                          = true
  rbac_aad_managed                  = true
  role_based_access_control_enabled = true
}

